pragma solidity ^0.4.17;

contract Campaign {
    
    Request[] public requests;
    address public manager;
    uint public minimumContribution;

    function Campaign(uint minimum) public{
        manager = msg.sender;
        minimumContribution = minimum;
    }

}