// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TransactionLedger {
    // Define a Transaction structure
    struct Transaction {
        address sender;
        address recipient;
        uint amount;
        uint timestamp;
    }

    // Array to store all transactions
    Transaction[] public transactions;

    // Event to log new transactions
    event TransactionRecorded(address indexed sender, address indexed recipient, uint amount, uint timestamp);

    // Function to record a new transaction
    function recordTransaction(address _recipient, uint _amount) public {
        // Create a new transaction object
        Transaction memory newTransaction = Transaction({
            sender: msg.sender,
            recipient: _recipient,
            amount: _amount,
            timestamp: block.timestamp
        });

        // Store the transaction in the array
        transactions.push(newTransaction);

        // Emit the transaction recorded event
        emit TransactionRecorded(msg.sender, _recipient, _amount, block.timestamp);
    }

    // Function to retrieve a specific transaction by index
    function getTransaction(uint index) public view returns (address, address, uint, uint) {
        require(index < transactions.length, "Transaction does not exist.");
        Transaction storage transaction = transactions[index];
        return (transaction.sender, transaction.recipient, transaction.amount, transaction.timestamp);
    }

    // Function to get the total number of transactions
    function getTransactionCount() public view returns (uint) {
        return transactions.length;
    }
}
