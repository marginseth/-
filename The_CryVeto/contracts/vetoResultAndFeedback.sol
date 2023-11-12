// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.16;

contract Result{

 struct feedbacks {
    bytes32 ID;
    bytes32 say;
    bytes32[] howsaed;
    address FeedDackMan;
 }

    feedbacks feed;

    mapping(address => bytes32) public feedback;
    
    function WiterBack(bytes32 ID,bytes32 say) public{
        feed.ID=ID;
        feedback[msg.sender] = say;
        feed.howsaed.push(feedback[msg.sender]);        
    }

    function ShowSay(bytes32 ID) public view returns(bytes32){
        if (feed.ID==ID){
            for (uint i; i<feed.howsaed.length ; i++){
                return feed.howsaed[i];
            }
        }
    }
}