// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MessageStorage {
    // State variable to store the message
    string public message;

    // Function to store a message
    function setMessage(string memory _message) public {
        message = _message;
    }

    // Function to retrieve the stored message
    function getMessage() private view returns (string memory) {
        return message;
    }
}
