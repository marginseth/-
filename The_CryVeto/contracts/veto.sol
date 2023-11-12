// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.16;

contract  TheVote {
    struct VoteMain {
        bytes32 ID;
        address Hosts; //记录投票发起者
        uint TrueVote;     //记录不赞成票数
        uint FalseVote;  //记录赞成票数
        address[] VotedMan;
        bool isActiol; //投票是否结束
    }

    VoteMain voteObject;

    function setID (bytes32 ID,address Hosts) public{
        voteObject.ID=ID;
        voteObject.Hosts=Hosts;
    }

    modifier IsCondut(){
        require(voteObject.isActiol==true,"Veto is end.");
        _;
    }
    
    function VetoEnd(address hosts) public{
        require(voteObject.Hosts==hosts,"you not is veto hosts");
        voteObject.isActiol=false;
    }

    function VoteActor(bool value)  public IsCondut{  //记录投票数据
        if (value == true){
            voteObject.TrueVote += 1;
        }
        if(value == false ){
            voteObject.FalseVote += 1;
        }
        voteObject.VotedMan.push(msg.sender); //将投票人存入已投数组
    }


    function GetValue() public view returns (uint TrueVote ,uint FalseVote){ //返回投票结果
        return (voteObject.TrueVote,voteObject.FalseVote);
    }


}