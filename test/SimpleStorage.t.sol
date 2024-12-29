// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/SimpleStorage.sol";

contract SimpleStorageTest is Test {
    SimpleStorage public simpleStorage;
    address public owner;
    address public newOwner;
    uint256 public initialNumber;

    event NumberUpdated(uint256 oldNumber, uint256 newNumber);

    function setUp() public {
        owner = address(this);
        newOwner = address(0xBEEF);
        initialNumber = 10;
        simpleStorage = new SimpleStorage(initialNumber);
    }

    function test_InitialState() public view {
        assertEq(simpleStorage.getNumber(), initialNumber);
        assertEq(simpleStorage.owner(), owner);
    }

    function test_SetNumber() public {
        uint256 newNumber = 20;
        simpleStorage.setNumber(newNumber);
        assertEq(simpleStorage.getNumber(), newNumber);
    }

    function test_SetNumber_OnlyOwner() public {
        vm.prank(newOwner);
        vm.expectRevert("Only owner can call this function");
        simpleStorage.setNumber(20);
    }

    function test_NumberUpdatedEvent() public {
        uint256 newNumber = 30;
        vm.expectEmit(false, false, false, true);
        emit NumberUpdated(initialNumber, newNumber);
        simpleStorage.setNumber(newNumber);
    }

    function test_TransferOwnership_OnlyOwner() public {
        vm.prank(newOwner);
        vm.expectRevert("Only owner can call this function");
        simpleStorage.transferOwnership(newOwner);
    }

    function test_TransferOwnership() public {
        simpleStorage.transferOwnership(newOwner);
        assertEq(simpleStorage.owner(), newOwner);
    }

    function testFuzz_SetNumber(uint256 newNumber) public {
        simpleStorage.setNumber(newNumber);
        assertEq(simpleStorage.getNumber(), newNumber);
    }

    function test_Deployment() public view {
        assertTrue(address(simpleStorage) != address(0), "Contract not deployed");
        assertEq(simpleStorage.getNumber(), initialNumber, "Initial number not set correctly");
        assertEq(simpleStorage.owner(), owner, "Owner not set correctly");
    }

    function testFuzz_Deployment(uint256 _initialNumber) public {
        SimpleStorage newSimpleStorage = new SimpleStorage(_initialNumber);

        assertEq(newSimpleStorage.getNumber(), _initialNumber, "Fuzzed initial number not set correctly");
        assertEq(newSimpleStorage.owner(), address(this), "Owner not set correctly in fuzzed deployment");
    }
}
