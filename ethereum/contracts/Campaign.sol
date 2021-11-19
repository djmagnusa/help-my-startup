pragma solidity ^0.4.17;

contract Campaign {
    
    function Campaign(uint minimum) public{
        manager = msg.sender;
        minimumContribution = minimum;
    }

}