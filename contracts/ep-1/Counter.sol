
// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import "hardhat/console.sol";

contract Counter {

    uint public counter;

    constructor(uint _counter){
        counter = _counter;
        console.log("Counter initialized to: ", counter);
    }

    function increment() external {
        counter += 1;
    }
}