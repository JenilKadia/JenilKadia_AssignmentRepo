// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DonationContract {

    // Structure to store individual donations
    struct Donation {
        address donor;
        uint256 amount;
        uint256 timestamp;
    }

    // Mapping from recipient to list of donations
    mapping(address => Donation[]) public donations;

    // Event for donation
    event DonationMade(address indexed donor, address indexed recipient, uint256 amount, uint256 timestamp);

    // Event for withdrawal
    event Withdrawal(address indexed recipient, uint256 amount);

    // Function to donate Ether to a recipient
    function donate(address _recipient) external payable {
        require(msg.value > 0, "Donation amount must be greater than zero");

        // Record the donation
        donations[_recipient].push(Donation({
            donor: msg.sender,
            amount: msg.value,
            timestamp: block.timestamp
        }));

        // Emit a donation event
        emit DonationMade(msg.sender, _recipient, msg.value, block.timestamp);
    }

    // Function for a recipient to withdraw their donations
    function withdrawDonations() external {
        uint256 totalDonations = getDonationBalance(msg.sender);
        require(totalDonations > 0, "No donations to withdraw");

        // Reset the donations for the recipient
        delete donations[msg.sender];

        // Transfer Ether to the recipient
        payable(msg.sender).transfer(totalDonations);

        // Emit withdrawal event
        emit Withdrawal(msg.sender, totalDonations);
    }

    // Function to get the total donation balance for a recipient
    function getDonationBalance(address _recipient) public view returns (uint256) {
        uint256 totalBalance = 0;
        Donation[] storage recipientDonations = donations[_recipient];

        for (uint256 i = 0; i < recipientDonations.length; i++) {
            totalBalance += recipientDonations[i].amount;
        }

        return totalBalance;
    }

    // Fallback function to accept Ether directly
    receive() external payable {
        // You can leave this empty to accept donations without a specific recipient.
    }
}
