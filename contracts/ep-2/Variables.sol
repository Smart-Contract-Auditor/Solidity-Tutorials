// SPDX-License-Identifier: MIT
// Credit to:
// https://solidity-by-example.org/variables/
// https://docs.soliditylang.org/en/latest/units-and-global-variables.html
pragma solidity ^0.8.24;

import "hardhat/console.sol"; 

contract Variables {
    // State variables are stored on the blockchain.
    string public text = "Hello";
    uint256 public num = 123;

    function doSomething() payable public {
        // Local variables are not saved to the blockchain.
        uint256 i = 456;

        // Here are some global variables
        // Current block timestamp, measured in seconds since the Unix epoch (January 1, 1970)
        uint256 timestamp = block.timestamp;
        console.log("Current block timestamp: ", timestamp);
        uint256 gaslimit = block.gaslimit;
        console.log("Current block gaslimit: ", gaslimit);
        address sender = msg.sender; // Address of the caller, can be a contract or a EOA.
        console.log("Address of the caller: ", sender);
        uint256 value = msg.value;
        console.log("Value sent with the message: ", value);
        address origin = tx.origin; // Can only be an EOA.
        console.log("Address of the original sender: ", origin);
        uint256 gasPrice = tx.gasprice;
        console.log("Gas price of the transaction: ", gasPrice);
        uint256 gasLeft = gasleft();
        console.log("Gas left in the transaction: ", gasLeft);
    }

    function doSomethingElse() public {
        // Ether units.
        // These cam be used with any token that has 18 decimals, not just ethereum.
        assert(1 wei == 1);
        assert(1 gwei == 1e9);
        assert(1 ether == 1e18);

        // Time units.
        // Take care if you perform calendar calculations using these units,
        // because not every year equals 365 days
        // and not even every day has 24 hours because of leap seconds.
        // Due to the fact that leap seconds cannot be predicted,
        // an exact calendar library has to be updated by an external oracle.
        uint8 oneSecond = 1; // 1 seconds
        uint8 oneMinute = 1 minutes; // 60 seconds
        assert(oneMinute / (oneSecond * 60) == 1);
        uint16 oneHour = 1 hours; // 60 minutes
        assert(oneHour / (uint16(oneMinute) * 60) == 1); // Cast to uint16 to avoid overflow.
        uint24 oneDay = 1 days; // 24 hours
        assert(oneDay / (uint24(oneHour) * 24) == 1); // Cast to uint24 to avoid overflow.
        uint24 oneWeek = 1 weeks; // 7 days
        assert(oneWeek / (oneDay * 7) == 1);
    }
}
