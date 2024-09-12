// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IntegerStorage {
    // State variable to store the integer value
    uint256 private storedInteger;

    // Function to set the integer value
    function setInteger(uint256 _value) public {
        storedInteger = _value;
    }

    // Function to get the integer value
    function getInteger() public view returns (uint256) {
        return storedInteger;
    }
}