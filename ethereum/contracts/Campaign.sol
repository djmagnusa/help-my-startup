pragma solidity ^0.4.17;

contract Campaign {

    struct Request {
        string description;
        uint value;
        address recipient;
        bool complete;
        uint approvalCount; //for only people voting yes
        mapping(address => bool) approvals; //people who provided the approval of this request
    }
    
    Request[] public requests;
    address public manager;
    uint public minimumContribution;

      modifier restricted() {
        require(msg.sender == manager);
        _;
    }


    function Campaign(uint minimum) public{
        manager = msg.sender;
        minimumContribution = minimum;
    }

    function contribute() public payable{
        require(msg.value > minimumContribution);
        
        approvers[msg.sender] = true;
        approversCount++;
        
    }

    function createRequest(string description, uint value, address recipient) public restricted {
        
       // require(approvers[msg.sender])  //if person has donated in the campaign
        
        Request memory newRequest = Request({
           description: description,
           value: value,
           recipient: recipient,
           complete: false,
           approvalCount: 0
        });
        
        requests.push(newRequest);
    } 
    

}