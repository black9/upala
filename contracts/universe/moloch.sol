pragma solidity ^0.5.0;

import "../incentives/group-example.sol";
import "../mockups/moloch-mock.sol"

contract MolochWrap is UpalaGroup {
    
    
    Moloch moloch;
    IERC20 public approvedToken;
    
    mapping ( address => uint256 ) public balances;
    
    constructor (address _moloch, address _approvedToken) {
        moloch = Moloch(_moloch);
        approvedToken = IERC20(_approvedToken);
    }

    modifier onlyDelegate {
        require(moloch.members[memberAddressByDelegateKey[msg.sender]].shares > 0, "Moloch::onlyDelegate - not a delegate");
        _;
    }
    
    deposit(uint tokens) internal {
        balances[msg.sender]+= tokens;
    }

    funtion isMolochMember(applicant) returns (bool) {
        return moloch.members[applicant].shares > 0
    }
    
    funtion join() external onlyDelegate {
        require(isMolochMember(msg.sender));
        require(approvedToken.transferFrom(applicant, address(this), tokenTribute), "Moloch::submitProposal - token transfer failed");
        
        balances[msg.sender]+= tokens;
    }
    
}