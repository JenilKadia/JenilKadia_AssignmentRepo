// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NameContract {
    // State variable to store the greeting message
    string private name;

    // Function to set the greeting message
    function setName(string memory _message) public {
        name = _message;
    }

    // Function to get the greeting message
    function getName() public view returns (string memory) {
        return name;
    }
}