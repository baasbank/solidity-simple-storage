// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/SimpleStorage.sol";

contract DeploySimpleStorage is Script {
    function run() external returns (SimpleStorage) {
        uint256 initialNumber = 10;

        vm.startBroadcast();
        SimpleStorage simpleStorage = new SimpleStorage(initialNumber);
        vm.stopBroadcast();

        return simpleStorage;
    }
}
