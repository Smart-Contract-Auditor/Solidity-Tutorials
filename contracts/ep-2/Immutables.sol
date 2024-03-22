// SPDX-License-Identifier: MIT
// Credit to: https://solidity-by-example.org/immutable/
pragma solidity ^0.8.24;

import "hardhat/console.sol";

contract Immutables {
    // Slightly less gas-efficient than constants.
    // coding convention to uppercase constant variables
    address public immutable MY_ADDRESS;
    uint256 public immutable MY_UINT;

    constructor(uint256 _myUint) {
        // MY_ADDRESS = msg.sender;
        uint x = MY_UINT;
        console.log("x is: ", x);
        MY_UINT = _myUint;
        uint y = MY_UINT;
        console.log("y is: ", y);
    }

    // function testSetImmutable() external {
    //     MY_ADDRESS = msg.sender; // This will raise a compilation error.
    // }
}