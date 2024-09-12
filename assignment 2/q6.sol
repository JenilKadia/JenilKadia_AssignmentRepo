// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    // Vote counts
    uint public chiragVotes = 0;
    uint public harshVotes = 0;

    // Function to vote for Chirag
    function voteChirag() public {
        chiragVotes += 1;
    }

    // Function to vote for Harsh
    function voteHarsh() public {
        harshVotes += 1;
    }

    // Function to get current vote counts
    function getVotes() public view returns (uint chirag, uint harsh) {
        return (chiragVotes, harshVotes);
    }
}
