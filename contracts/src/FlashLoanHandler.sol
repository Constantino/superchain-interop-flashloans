// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {Test, console} from "forge-std/Test.sol";
import {TestUSDToken, UniswapDummyContract} from "./UniswapDummyContract.sol";
import {FlashLoanVault} from "./FlashLoanVault.sol";
import {ISuperchainWETH} from "@interop-lib/interfaces/ISuperchainWETH.sol";
import {IL2ToL2CrossDomainMessenger} from "@interop-lib/interfaces/IL2ToL2CrossDomainMessenger.sol";
import {CrossDomainMessageLib} from "@interop-lib/libraries/CrossDomainMessageLib.sol";

contract FlashLoanHandler {

    event FlashLoanRecieved();

    TestUSDToken public token;
    address uniswapDummyContractAddress;
    UniswapDummyContract uniswapDummyContract;

    address payable superchainWEthAddress = payable(0x4200000000000000000000000000000000000024);
    ISuperchainWETH superchainWEth = ISuperchainWETH(superchainWEthAddress);
    IL2ToL2CrossDomainMessenger public constant messenger =
        IL2ToL2CrossDomainMessenger(0x4200000000000000000000000000000000000023);

    address payable flashLoanVaultAddress;
    FlashLoanVault flashLoanVault;

    constructor(address _uniswapDummyContractAddress, address _flashLoanVaultAddress) {
        uniswapDummyContractAddress = _uniswapDummyContractAddress;
        uniswapDummyContract = UniswapDummyContract(uniswapDummyContractAddress);
        token = uniswapDummyContract.getToken();

        flashLoanVaultAddress = payable(_flashLoanVaultAddress);
        flashLoanVault = FlashLoanVault(flashLoanVaultAddress);

    }

    function executeArbitrage(uint256 ethAmount) private {
        require(ethAmount <= address(this).balance, "ETH Amount > Balance, Can't run arbitrage");
        uniswapDummyContract.sellEth{value: ethAmount}();
    
        uint256 tokenBalance = token.balanceOf(address(this));
        require(tokenBalance > 0, "TOKEN Balance is zero after selling ETH");

        console.log("token balance: ", tokenBalance);
        token.approve(uniswapDummyContractAddress, tokenBalance);
        uniswapDummyContract.buyEth(payable(address(this)), tokenBalance);
    }

    function recieveEthForArbitrage() public payable {
        executeArbitrage(msg.value);
    }

    function recieveEthForArbitrageSourceChain(uint256 destinationChain, address caller, uint256 laonAmount) 
    public payable {
        bytes32 sendEthMsgHash = superchainWEth.sendETH{value: address(this).balance}(address(this), destinationChain);
        
        messenger.sendMessage(
            destinationChain,
            address(this),
            abi.encodeWithSelector(
                this.recieveEthForArbitrageDestinationChain.selector,
                sendEthMsgHash,
                uint256(block.chainid),
                caller,
                laonAmount
                )
        );
    }

    function recieveEthForArbitrageDestinationChain(bytes32 sendEthMsgHash, uint256 sourceChain, address caller, uint256 loanAmount) 
    external {
        CrossDomainMessageLib.requireCrossDomainCallback();
        CrossDomainMessageLib.requireMessageSuccess(sendEthMsgHash);

        executeArbitrage(address(this).balance);

        bytes32 sendEthMsgHashBack = superchainWEth.sendETH{value: address(this).balance}(address(this), sourceChain);
        
        messenger.sendMessage(
            sourceChain,
            address(this),
            abi.encodeWithSelector(
                this.recieveEthOnSourceChainFromDestinationChain.selector,
                sendEthMsgHashBack,
                caller,
                loanAmount
                )
            );
    }

    function recieveEthOnSourceChainFromDestinationChain(bytes32 sendEthMsgHash, address caller, uint256 loanAmount) external{
        CrossDomainMessageLib.requireCrossDomainCallback();
        CrossDomainMessageLib.requireMessageSuccess(sendEthMsgHash);

        uint256 profit = address(this).balance - loanAmount;

        if(profit > 0){
            flashLoanVaultAddress.call {value: loanAmount} ("");
            payable(caller).call {value: address(this).balance} ("");
        }
        else {
            flashLoanVaultAddress.call {value: address(this).balance} ("");
        }
    }

    function initFlashLoan(uint256 destinationChain) public {
        require(destinationChain != block.chainid, "Destination Chain Cannot Be Same As Source Chain");

        uint256 loanAmountRecieved = flashLoanVault.processMaxLoanRequest();

        emit FlashLoanRecieved();

        this.recieveEthForArbitrageSourceChain(destinationChain, msg.sender, loanAmountRecieved);
    }

    receive() external payable{}
}