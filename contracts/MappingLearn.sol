// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;


contract MappingLearn {
    string constant public version = "1.0.0";

    uint256 immutable public challengePeriod;  // immutable 修饰的变量消耗的 gas 是极低的

    mapping(address => uint256) public balances;

    constructor(uint256 _challengePeriod) {
        challengePeriod = _challengePeriod;
    }

    function setBalance(uint _balance) public {
        balances[msg.sender] = _balance;
    }


    function getBalance() public view returns (uint) {
        return balances[msg.sender];
    }

//    function updateChallengePeriod(uint256 _challengePeriod) public  {
//        challengePeriod = _challengePeriod;
//    }
}
