// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Certification{
    //errors
    error NotEmployer();
    error notOwner();
    //Storage Variables
    struct infoCertificate{
        string name;
        string course;
        string dateOfIssue;
        uint256 certficationId;
    }
    // mapping(address userId => uint256 certificationId) userToCertificate;
    mapping (uint256 certificationId => bool certificateExists) certificateExist;
    mapping (uint256 employerId => string name) nameToEmployer;
    mapping(uint256 empolyerId => bool employerExists) employerToExist;
    mapping (uint256 empoloyerId => mapping(uint256 certificationId => bool certificateExists)) employerToCertificate;
    mapping(uint256 certificationId => infoCertificate certificate) certificateToInfo;
    address owner;
    //Constructor
    constructor(){
        owner = msg.sender;
    }

    //Modifiers
    modifier onlyOwner{
        if(owner != msg.sender) revert notOwner();
        
        _;
    }
    modifier onlyEmployer(uint256 employerId){
        if(!employerToExist[employerId]) revert NotEmployer();
        _;
    }
    //Functions
    function registerEmployer(uint256 employerId, string memory name) onlyOwner public{
        employerToExist[employerId] = true;
        nameToEmployer[employerId] = name;


    }


    function addCertificate(uint256 certificationId,uint256 employerId,string memory name,string memory course,string memory dateOfIssue) onlyEmployer(employerId) public {
      
        // userToCertificate[userId] = certificationId;
        employerToCertificate[employerId][certificationId] = true;
        certificateExist[certificationId] = true;
        certificateToInfo[certificationId] = infoCertificate(name,course,dateOfIssue,certificationId);
        
    }

    function checkCertificate(uint256 certficationId) public view returns (bool){
        return certificateExist[certficationId];
    }
     function getCertificate(uint256 certificationId) public view returns (string memory name,string memory course,string memory dateOfIsue){
       return (certificateToInfo[certificationId].name,certificateToInfo[certificationId].course,certificateToInfo[certificationId].dateOfIssue);

     }
}