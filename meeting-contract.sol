pragma solidity >=0.4.22 <0.7.0;

contract MeetingContract { 

	address contractDeployer;
	
	string meetingName;
	
	bytes32[] meetingMembers;	
	
	constructor () payable public {
		contractDeployer = msg.sender;
	}
	
	function getMeetingName() view public returns (string) {
	    return meetingName;    
	}
	
	function setMeetingName(string _meetingName) payable public {
	    if (msg.sender == contractDeployer){
	        meetingName = _meetingName;
	    }
	}
	
	function registerMember(string _hashedPassport) payable public {
	    if (!this.isRegistered(_hashedPassport)){
	        meetingMembers.push(keccak256(abi.encodePacked(_hashedPassport)));
	    }
	}
	
	function isRegistered(string _hashedPassport) view public returns (bool){
	    bytes32 passportHash = keccak256(abi.encodePacked(_hashedPassport));
	    
	    for (uint i = 0; i < meetingMembers.length; i++){
	        if (meetingMembers[i] == passportHash){
	            return true;
	        }
	    }
	    
	    return false;
	}
}