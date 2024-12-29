// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {
    uint256 number;
    address public owner;

    event NumberUpdated(uint256 oldNumber, uint256 newNumber);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    constructor(uint256 _number) {
        number = _number;
        owner = msg.sender;
    }

    function getNumber() public view returns (uint256) {
        return number;
    }

    function setNumber(uint256 newNumber) public onlyOwner {
        uint256 oldNumber = number;
        number = newNumber;
        emit NumberUpdated(oldNumber, newNumber);
    }

    function transferOwnership(address newOwner) public onlyOwner {
        owner = newOwner;
    }
}
