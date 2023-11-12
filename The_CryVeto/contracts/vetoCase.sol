// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.16;


contract TheCase{

    struct VetoSkill{
        bytes32 ID;
        address Vetohosts;
        bytes32 VetoCase;
        bytes32 Vetotitle;
    }

    VetoSkill vetoskill;


    function setVeto(bytes32 VetoCase,bytes32 Vetotitle,address Vetohosts,bytes32 ID) public{
        vetoskill.VetoCase=VetoCase;
        vetoskill.Vetohosts=Vetohosts;
        vetoskill.Vetotitle=Vetotitle;
        vetoskill.ID=ID;
    }

    function getVeto() public view returns (bytes32,address){
        return (vetoskill.VetoCase, vetoskill.Vetohosts);
    }

}