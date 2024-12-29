// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/SimpleStorage.sol";

contract InteractSimpleStorage is Script {
    function run() external {
        // Replace with your deployed contract address
        address contractAddress = address(0x5FbDB2315678afecb367f032d93F642f64180aa3);
        SimpleStorage simpleStorage = SimpleStorage(contractAddress);

        // Read current value
        uint256 currentNumber = simpleStorage.getNumber();
        console.log("Current number:", currentNumber);

        // Set new value
        vm.startBroadcast();
        simpleStorage.setNumber(42);
        vm.stopBroadcast();

        // Verify new value
        uint256 newNumber = simpleStorage.getNumber();
        console.log("New number:", newNumber);
    }
}
