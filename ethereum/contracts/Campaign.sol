pragma solidity ^0.4.17;

contract CampaignFactory{
    
    address[] public deployedCampaigns;
    
    function createCampaign(uint minimum) public {
       address newCampaign =  new Campaign(minimum, msg.sender);
       deployedCampaigns.push(newCampaign);
    }
    
    function getDeployedCampaigns() public view returns (address[]) {
        return deployedCampaigns;
    }
    
}

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
    mapping(address => bool) public approvers;
    uint public approversCount;

    modifier restricted() {
        require(msg.sender == manager);
        _;
    }


   function Campaign(uint minimum, address creator) public{
        manager = creator;
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

     
    function approveRequest(uint index) public { //to approve request at a particular index
        Request storage request = requests[index];
        
        require(approvers[msg.sender]); //making sure person is donator
        require(!request.approvals[msg.sender]); //checking if person already voted, if yes exit
        
        request.approvals[msg.sender] = true;
        request.approvalCount++; //the request got one vote
    }

     function finalizeRequest(uint index) public restricted {
        Request storage request = requests[index];
        
        require(request.approvalCount > (approversCount/2));
        require(!request.complete); //if request is already completed exit
        
        
        request.recipient.transfer(request.value);
        request.complete = true;
    }   

    function getSummary() public view returns (
        uint, uint, uint, uint, address
    ) {
        return (
            minimumContribution,
            this.balance,
            requests.length,
            approversCount,
            manager
        );
    }

    function getRequestsCount() public view returns (uint) {
        return requests.length;
    }

}