// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Lottery {  //Contract name is Lottery
    
    address public owner; //Owner is a Contract Manager who control this Lottery
    address payable[] public participants; //In payable array every participent store

    constructor() {
        owner = msg.sender; //Owner will be that person who deploy the contract 
    }

    receive() external payable {
        //If sending ether is 1 then other line execute else next line execute
        require(msg.value == 1 ether, "Minimum amount to participat is 1 Etherium");
        //when the required amount is sent, the sender's address will be stored in payable array
        participants.push(payable(msg.sender)); 
    }

    modifier onlyOwner { 
        require(msg.sender == owner, "You are not the Owner");
        _;
    }

    function getBalance() public view onlyOwner returns (uint) {
        //it shows the balance 
        return address(this).balance;
    }

    function random() private view returns(uint) { // this function generates a random number
        return uint(keccak256( abi.encodePacked (block.difficulty, block.timestamp, participants.length)));
    }

    function lotteryWinner() public onlyOwner {
        //If the participants are equal or greater than 3 then other lines execute else the next line execute
        require(participants.length >= 3, "Participents are not enough");
        uint randomNumber = random(); 
        uint winnerIndex = randomNumber % participants.length;
        address payable winner = participants[winnerIndex];
        winner.transfer(getBalance()); //All amount which is in getBalance will transfer to the winner
        participants = new address payable[](0); //After the Lottery ends array will be 0
    }
}
