// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.26;

// import "https://github.com/aave/aave-v3-core/blob/master/contracts/flashloan/base/FlashLoanSimpleReceiverBase.sol";
// import "https://github.com/aave/aave-v3-core/blob/master/contracts/interfaces/IPoolAddressesProvider.sol";
// import "https://github.com/aave/aave-v3-core/blob/master/contracts/dependencies/openzeppelin/contracts/IERC20.sol";

// contract SimpleFlashLoan is FlashLoanSimpleReceiverBase {
//     address payable owner;

//     event Log(string message, uint256 value);

//     constructor(
//         address _addressProvider
//     ) FlashLoanSimpleReceiverBase(IPoolAddressesProvider(_addressProvider)) {}

//     function fn_RequestFlashLoan(address _token, uint256 _amount) public {
//         address receiverAddress = address(this);
//         address asset = _token;
//         uint256 amount = _amount;
//         bytes memory params = "";
//         uint16 referralCode = 0;

//         POOL.flashLoanSimple(
//             receiverAddress,
//             asset,
//             amount,
//             params,
//             referralCode
//         );
//     }

//     //This function is called after your contract has received the flash loaned amount

//     function executeOperation(
//         address asset,
//         uint256 amount,
//         uint256 premium,
//         address initiator,
//         bytes calldata params
//     ) external override returns (bool) {
//         //Logic goes here

//         uint256 totalAmount = amount + premium;

//         uint256 balance = IERC20(asset).balanceOf(address(this));
//         emit Log("Balance before repayment", balance);
//         emit Log("Total to repay", totalAmount);

//         require(balance >= totalAmount, "Insufficient balance to repay");

//         IERC20(asset).approve(address(POOL), totalAmount);

//         return true;
//     }

//     receive() external payable {}
// }
