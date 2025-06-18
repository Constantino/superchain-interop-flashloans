// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import {IERC7802, IERC165} from "@interop-lib/interfaces/IERC7802.sol";
import {PredeployAddresses} from "@interop-lib/libraries/PredeployAddresses.sol";

contract TokenA is IERC7802, ERC20 {
    constructor() ERC20("TokenA", "TokenA") {
        //_mint(msg.sender, 1000000 * 10 ** decimals()); // Mint 1,000,000 TUSD to deployer
    }

    function mint(address to, uint256 amount) external {
        _mint(to, amount);
    }

    /// @notice Allows the SuperchainTokenBridge to mint tokens.
    /// @param _to     Address to mint tokens to.
    /// @param _amount Amount of tokens to mint.
    function crosschainMint(address _to, uint256 _amount) external {
        // Only the `SuperchainTokenBridge` has permissions to mint tokens during crosschain transfers.
        require(
            msg.sender == PredeployAddresses.SUPERCHAIN_TOKEN_BRIDGE,
            "Unauthorized"
        );

        // Mint tokens to the `_to` account's balance.
        _mint(_to, _amount);

        // Emit the CrosschainMint event included on IERC7802 for tracking token mints associated with cross chain transfers.
        emit CrosschainMint(_to, _amount, msg.sender);
    }

    /// @notice Allows the SuperchainTokenBridge to burn tokens.
    /// @param _from   Address to burn tokens from.
    /// @param _amount Amount of tokens to burn.
    function crosschainBurn(address _from, uint256 _amount) external {
        // Only the `SuperchainTokenBridge` has permissions to burn tokens during crosschain transfers.
        require(
            msg.sender == PredeployAddresses.SUPERCHAIN_TOKEN_BRIDGE,
            "Unauthorized"
        );

        // Burn the tokens from the `_from` account's balance.
        _burn(_from, _amount);

        // Emit the CrosschainBurn event included on IERC7802 for tracking token burns associated with cross chain transfers.
        emit CrosschainBurn(_from, _amount, msg.sender);
    }

    /// @notice Query if a contract implements an interface
    /// @param _interfaceId The interface identifier, as specified in ERC-165
    /// @dev Interface identification is specified in ERC-165. This function
    /// uses less than 30,000 gas.
    /// @return `true` if the contract implements `interfaceID` and
    /// `interfaceID` is not 0xffffffff, `false` otherwise
    function supportsInterface(
        bytes4 _interfaceId
    ) public view virtual returns (bool) {
        return
            _interfaceId == type(IERC7802).interfaceId ||
            _interfaceId == type(IERC20).interfaceId ||
            _interfaceId == type(IERC165).interfaceId;
    }
}

contract TokenB is IERC7802, ERC20 {
    constructor() ERC20("TokenB", "TokenB") {
        //_mint(msg.sender, 1000000 * 10 ** decimals()); // Mint 1,000,000 TUSD to deployer
    }

    function mint(address to, uint256 amount) external {
        _mint(to, amount);
    }

    /// @notice Allows the SuperchainTokenBridge to mint tokens.
    /// @param _to     Address to mint tokens to.
    /// @param _amount Amount of tokens to mint.
    function crosschainMint(address _to, uint256 _amount) external {
        // Only the `SuperchainTokenBridge` has permissions to mint tokens during crosschain transfers.
        require(
            msg.sender == PredeployAddresses.SUPERCHAIN_TOKEN_BRIDGE,
            "Unauthorized"
        );

        // Mint tokens to the `_to` account's balance.
        _mint(_to, _amount);

        // Emit the CrosschainMint event included on IERC7802 for tracking token mints associated with cross chain transfers.
        emit CrosschainMint(_to, _amount, msg.sender);
    }

    /// @notice Allows the SuperchainTokenBridge to burn tokens.
    /// @param _from   Address to burn tokens from.
    /// @param _amount Amount of tokens to burn.
    function crosschainBurn(address _from, uint256 _amount) external {
        // Only the `SuperchainTokenBridge` has permissions to burn tokens during crosschain transfers.
        require(
            msg.sender == PredeployAddresses.SUPERCHAIN_TOKEN_BRIDGE,
            "Unauthorized"
        );

        // Burn the tokens from the `_from` account's balance.
        _burn(_from, _amount);

        // Emit the CrosschainBurn event included on IERC7802 for tracking token burns associated with cross chain transfers.
        emit CrosschainBurn(_from, _amount, msg.sender);
    }

    /// @notice Query if a contract implements an interface
    /// @param _interfaceId The interface identifier, as specified in ERC-165
    /// @dev Interface identification is specified in ERC-165. This function
    /// uses less than 30,000 gas.
    /// @return `true` if the contract implements `interfaceID` and
    /// `interfaceID` is not 0xffffffff, `false` otherwise
    function supportsInterface(
        bytes4 _interfaceId
    ) public view virtual returns (bool) {
        return
            _interfaceId == type(IERC7802).interfaceId ||
            _interfaceId == type(IERC20).interfaceId ||
            _interfaceId == type(IERC165).interfaceId;
    }
}

contract TokenC is IERC7802, ERC20 {
    constructor() ERC20("TokenC", "TokenC") {
        //_mint(msg.sender, 1000000 * 10 ** decimals()); // Mint 1,000,000 TUSD to deployer
    }

    function mint(address to, uint256 amount) external {
        _mint(to, amount);
    }

    /// @notice Allows the SuperchainTokenBridge to mint tokens.
    /// @param _to     Address to mint tokens to.
    /// @param _amount Amount of tokens to mint.
    function crosschainMint(address _to, uint256 _amount) external {
        // Only the `SuperchainTokenBridge` has permissions to mint tokens during crosschain transfers.
        require(
            msg.sender == PredeployAddresses.SUPERCHAIN_TOKEN_BRIDGE,
            "Unauthorized"
        );

        // Mint tokens to the `_to` account's balance.
        _mint(_to, _amount);

        // Emit the CrosschainMint event included on IERC7802 for tracking token mints associated with cross chain transfers.
        emit CrosschainMint(_to, _amount, msg.sender);
    }

    /// @notice Allows the SuperchainTokenBridge to burn tokens.
    /// @param _from   Address to burn tokens from.
    /// @param _amount Amount of tokens to burn.
    function crosschainBurn(address _from, uint256 _amount) external {
        // Only the `SuperchainTokenBridge` has permissions to burn tokens during crosschain transfers.
        require(
            msg.sender == PredeployAddresses.SUPERCHAIN_TOKEN_BRIDGE,
            "Unauthorized"
        );

        // Burn the tokens from the `_from` account's balance.
        _burn(_from, _amount);

        // Emit the CrosschainBurn event included on IERC7802 for tracking token burns associated with cross chain transfers.
        emit CrosschainBurn(_from, _amount, msg.sender);
    }

    /// @notice Query if a contract implements an interface
    /// @param _interfaceId The interface identifier, as specified in ERC-165
    /// @dev Interface identification is specified in ERC-165. This function
    /// uses less than 30,000 gas.
    /// @return `true` if the contract implements `interfaceID` and
    /// `interfaceID` is not 0xffffffff, `false` otherwise
    function supportsInterface(
        bytes4 _interfaceId
    ) public view virtual returns (bool) {
        return
            _interfaceId == type(IERC7802).interfaceId ||
            _interfaceId == type(IERC20).interfaceId ||
            _interfaceId == type(IERC165).interfaceId;
    }
}

contract TokenD is IERC7802, ERC20 {
    constructor() ERC20("TokenD", "TokenD") {
        //_mint(msg.sender, 1000000 * 10 ** decimals()); // Mint 1,000,000 TUSD to deployer
    }

    function mint(address to, uint256 amount) external {
        _mint(to, amount);
    }

    /// @notice Allows the SuperchainTokenBridge to mint tokens.
    /// @param _to     Address to mint tokens to.
    /// @param _amount Amount of tokens to mint.
    function crosschainMint(address _to, uint256 _amount) external {
        // Only the `SuperchainTokenBridge` has permissions to mint tokens during crosschain transfers.
        require(
            msg.sender == PredeployAddresses.SUPERCHAIN_TOKEN_BRIDGE,
            "Unauthorized"
        );

        // Mint tokens to the `_to` account's balance.
        _mint(_to, _amount);

        // Emit the CrosschainMint event included on IERC7802 for tracking token mints associated with cross chain transfers.
        emit CrosschainMint(_to, _amount, msg.sender);
    }

    /// @notice Allows the SuperchainTokenBridge to burn tokens.
    /// @param _from   Address to burn tokens from.
    /// @param _amount Amount of tokens to burn.
    function crosschainBurn(address _from, uint256 _amount) external {
        // Only the `SuperchainTokenBridge` has permissions to burn tokens during crosschain transfers.
        require(
            msg.sender == PredeployAddresses.SUPERCHAIN_TOKEN_BRIDGE,
            "Unauthorized"
        );

        // Burn the tokens from the `_from` account's balance.
        _burn(_from, _amount);

        // Emit the CrosschainBurn event included on IERC7802 for tracking token burns associated with cross chain transfers.
        emit CrosschainBurn(_from, _amount, msg.sender);
    }

    /// @notice Query if a contract implements an interface
    /// @param _interfaceId The interface identifier, as specified in ERC-165
    /// @dev Interface identification is specified in ERC-165. This function
    /// uses less than 30,000 gas.
    /// @return `true` if the contract implements `interfaceID` and
    /// `interfaceID` is not 0xffffffff, `false` otherwise
    function supportsInterface(
        bytes4 _interfaceId
    ) public view virtual returns (bool) {
        return
            _interfaceId == type(IERC7802).interfaceId ||
            _interfaceId == type(IERC20).interfaceId ||
            _interfaceId == type(IERC165).interfaceId;
    }
}

contract TestUSDToken is IERC7802, ERC20 {
    constructor() ERC20("TestUSDToken", "TUSD") {
        //_mint(msg.sender, 1000000 * 10 ** decimals()); // Mint 1,000,000 TUSD to deployer
    }

    function mint(address to, uint256 amount) external {
        _mint(to, amount);
    }

    /// @notice Allows the SuperchainTokenBridge to mint tokens.
    /// @param _to     Address to mint tokens to.
    /// @param _amount Amount of tokens to mint.
    function crosschainMint(address _to, uint256 _amount) external {
        // Only the `SuperchainTokenBridge` has permissions to mint tokens during crosschain transfers.
        require(
            msg.sender == PredeployAddresses.SUPERCHAIN_TOKEN_BRIDGE,
            "Unauthorized"
        );

        // Mint tokens to the `_to` account's balance.
        _mint(_to, _amount);

        // Emit the CrosschainMint event included on IERC7802 for tracking token mints associated with cross chain transfers.
        emit CrosschainMint(_to, _amount, msg.sender);
    }

    /// @notice Allows the SuperchainTokenBridge to burn tokens.
    /// @param _from   Address to burn tokens from.
    /// @param _amount Amount of tokens to burn.
    function crosschainBurn(address _from, uint256 _amount) external {
        // Only the `SuperchainTokenBridge` has permissions to burn tokens during crosschain transfers.
        require(
            msg.sender == PredeployAddresses.SUPERCHAIN_TOKEN_BRIDGE,
            "Unauthorized"
        );

        // Burn the tokens from the `_from` account's balance.
        _burn(_from, _amount);

        // Emit the CrosschainBurn event included on IERC7802 for tracking token burns associated with cross chain transfers.
        emit CrosschainBurn(_from, _amount, msg.sender);
    }

    /// @notice Query if a contract implements an interface
    /// @param _interfaceId The interface identifier, as specified in ERC-165
    /// @dev Interface identification is specified in ERC-165. This function
    /// uses less than 30,000 gas.
    /// @return `true` if the contract implements `interfaceID` and
    /// `interfaceID` is not 0xffffffff, `false` otherwise
    function supportsInterface(
        bytes4 _interfaceId
    ) public view virtual returns (bool) {
        return
            _interfaceId == type(IERC7802).interfaceId ||
            _interfaceId == type(IERC20).interfaceId ||
            _interfaceId == type(IERC165).interfaceId;
    }
}

contract UniswapDummyContract {
    TestUSDToken public token;
    TokenA public tokenA;
    TokenB public tokenB;
    TokenC public tokenC;
    TokenD public tokenD;
    uint256 public minAmount = 0;

    // TODO: get price of eth in USDC from chainlink
    uint256 public price_eth_in_usdc = 2500;

    // TODO: expected premium to identify
    uint256 public premium_percent = 300; //3 percent

    // Fixed rates for token pairs (in basis points, 1 = 0.01%)
    uint256 public constant RATE_A_TO_USD = 120; // 1.2 USD per TokenA
    uint256 public constant RATE_B_TO_USD = 80; // 0.8 USD per TokenB
    uint256 public constant RATE_C_TO_USD = 150; // 1.5 USD per TokenC
    uint256 public constant RATE_D_TO_USD = 200; // 2.0 USD per TokenD

    // function fund () {

    // }
    constructor(TestUSDToken _token) {
        token = _token;
        token.mint(address(this), 100_000_000_000 ether);
    }

    constructor(
        TestUSDToken _token,
        TokenA _tokenA,
        TokenB _tokenB,
        TokenC _tokenC,
        TokenD _tokenD
    ) {
        tokenA = _tokenA;
        tokenB = _tokenB;
        tokenC = _tokenC;
        tokenD = _tokenD;
        token = _token;
        token.mint(address(this), 100_000_000_000 ether);
        tokenA.mint(address(this), 100_000_000_000 ether);
        tokenB.mint(address(this), 100_000_000_000 ether);
        tokenC.mint(address(this), 100_000_000_000 ether);
        tokenD.mint(address(this), 100_000_000_000 ether);
    }

    function getEthPrice(uint256 amountToken0) public view returns (uint256) {
        // require(token0 == wethToken, "This is not the token you're looking for");
        // require(token1 == usdToken, "This is not a USDC Token");

        uint256 value = (amountToken0 * price_eth_in_usdc * premium_percent) /
            10000;

        return value;
    }

    function sellEth() public payable {
        require(msg.value > 0, "Send ETH to receive tokens");

        uint256 tokenAmount = msg.value * price_eth_in_usdc;

        token.transfer(msg.sender, tokenAmount);
    }

    function buyEth(
        address payable receivingAddress,
        uint256 tusdAmount
    ) public {
        require(tusdAmount > 0, "Send TUSD to receive ETH");

        uint256 ethAmount = tusdAmount / price_eth_in_usdc;
        uint256 finalEthAmount = ethAmount +
            ((ethAmount * premium_percent) / 10000);

        require(
            address(this).balance >= finalEthAmount,
            "Not enough ETH in contract"
        );

        token.transferFrom(msg.sender, address(this), tusdAmount);
        receivingAddress.transfer(finalEthAmount);
    }

    function getToken() public view returns (TestUSDToken) {
        return token;
    }

    function swap(
        address tokenIn,
        address tokenOut,
        uint256 amountIn
    ) external payable returns (uint256 amountOut) {
        require(amountIn > 0, "Amount in must be greater than 0");

        // Handle ETH input
        if (tokenIn == address(0)) {
            require(msg.value == amountIn, "Incorrect ETH amount");
        } else {
            require(msg.value == 0, "ETH not accepted for token swaps");
            IERC20(tokenIn).transferFrom(msg.sender, address(this), amountIn);
        }

        // Calculate output amount based on token pair
        if (tokenIn == address(0)) {
            // ETH in
            if (tokenOut == address(token)) {
                amountOut = amountIn * price_eth_in_usdc;
            } else if (tokenOut == address(tokenA)) {
                amountOut =
                    (amountIn * price_eth_in_usdc * 10000) /
                    RATE_A_TO_USD;
            } else if (tokenOut == address(tokenB)) {
                amountOut =
                    (amountIn * price_eth_in_usdc * 10000) /
                    RATE_B_TO_USD;
            } else if (tokenOut == address(tokenC)) {
                amountOut =
                    (amountIn * price_eth_in_usdc * 10000) /
                    RATE_C_TO_USD;
            } else if (tokenOut == address(tokenD)) {
                amountOut =
                    (amountIn * price_eth_in_usdc * 10000) /
                    RATE_D_TO_USD;
            }
        } else if (tokenOut == address(0)) {
            // ETH out
            if (tokenIn == address(token)) {
                amountOut = amountIn / price_eth_in_usdc;
            } else if (tokenIn == address(tokenA)) {
                amountOut =
                    (amountIn * RATE_A_TO_USD) /
                    (price_eth_in_usdc * 10000);
            } else if (tokenIn == address(tokenB)) {
                amountOut =
                    (amountIn * RATE_B_TO_USD) /
                    (price_eth_in_usdc * 10000);
            } else if (tokenIn == address(tokenC)) {
                amountOut =
                    (amountIn * RATE_C_TO_USD) /
                    (price_eth_in_usdc * 10000);
            } else if (tokenIn == address(tokenD)) {
                amountOut =
                    (amountIn * RATE_D_TO_USD) /
                    (price_eth_in_usdc * 10000);
            }
        } else {
            // Token to token
            uint256 usdValue;
            if (tokenIn == address(token)) {
                usdValue = amountIn;
            } else if (tokenIn == address(tokenA)) {
                usdValue = (amountIn * RATE_A_TO_USD) / 10000;
            } else if (tokenIn == address(tokenB)) {
                usdValue = (amountIn * RATE_B_TO_USD) / 10000;
            } else if (tokenIn == address(tokenC)) {
                usdValue = (amountIn * RATE_C_TO_USD) / 10000;
            } else if (tokenIn == address(tokenD)) {
                usdValue = (amountIn * RATE_D_TO_USD) / 10000;
            }

            if (tokenOut == address(token)) {
                amountOut = usdValue;
            } else if (tokenOut == address(tokenA)) {
                amountOut = (usdValue * 10000) / RATE_A_TO_USD;
            } else if (tokenOut == address(tokenB)) {
                amountOut = (usdValue * 10000) / RATE_B_TO_USD;
            } else if (tokenOut == address(tokenC)) {
                amountOut = (usdValue * 10000) / RATE_C_TO_USD;
            } else if (tokenOut == address(tokenD)) {
                amountOut = (usdValue * 10000) / RATE_D_TO_USD;
            }
        }

        require(amountOut > 0, "Insufficient output amount");

        // Transfer output tokens
        if (tokenOut == address(0)) {
            (bool success, ) = msg.sender.call{value: amountOut}("");
            require(success, "ETH transfer failed");
        } else {
            IERC20(tokenOut).transfer(msg.sender, amountOut);
        }

        return amountOut;
    }

    receive() external payable {}
}
