// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventLogger {
    // Declare an event
    event OwnershipClaimed(address indexed newOwner);
    event PublicFunctionCalled(address caller);
    
    // State variable to store the owner's address
    address public owner;
    bytes32 private passwordHash;

    // Constructor sets the hashed password
    constructor() {
        passwordHash = keccak256(abi.encodePacked("Harsh"));
    }

    // Function to check password and access restricted area
    function accessRestrictedArea(string memory _password) public returns (string memory) {
        if (keccak256(abi.encodePacked(_password)) == passwordHash) {
            owner = msg.sender;
            emit OwnershipClaimed(owner); // Log the event
            return "You are the owner";
        } else {
            return "Access Denied";
        }
    }

    // Public function accessible to everyone
    function publicFunction() public returns (string memory) {
        emit PublicFunctionCalled(msg.sender); // Log the event
        return "Have a nice day";
    }
}
