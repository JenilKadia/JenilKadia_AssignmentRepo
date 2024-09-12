// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PasswordProtected {
    // Store the hashed password
    bytes32 private passwordHash;

    // Constructor sets the hashed password
    constructor() {
        passwordHash = keccak256(abi.encodePacked("Harsh"));
    }

    // Function to check password and access restricted area
    function accessRestrictedArea(string memory _password) public view returns (string memory) {
        if (keccak256(abi.encodePacked(_password)) == passwordHash) {
            return "You are the owner";
        } else {
            return "Access Denied";
        }
    }

    // Public function accessible to everyone
    function publicFunction() public pure returns (string memory) {
        return "Have a nice day";
    }
}
