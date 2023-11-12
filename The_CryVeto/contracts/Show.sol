// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.16;

import "./veto.sol";
import "./vetoCase.sol";
import "./vetoResultAndFeedback.sol";

contract ShowVeto{

    bytes32 ID = blockhash(block.number);

    TheCase thecase;
    TheVote thevote;
    Result result;

    function CreatVeto(bytes32 VetoCase,bytes32 Vetotitle,address Vetohosts,bytes32 ID) public{
        thecase.setVeto(VetoCase,Vetotitle,Vetohosts,ID);
    } 

    function showveto() view public{
        thecase.getVeto();
    }

    function onVeto(bool value) public{
        thevote.setID(ID,msg.sender);
        thevote.VoteActor(value);
    }

    function Vetofeedbark(bytes32 say) public {
        result.WiterBack(ID,say);
    }

    function ReadVeto() view public{
        thevote.GetValue();
        result.ShowSay(ID);
    }


}