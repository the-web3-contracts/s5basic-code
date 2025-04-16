// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "hardhat/console.sol";

/*
 * require: 用于输入验证和状态检查, 失败时返回剩余 gas 并恢复状态
 * revert: 用自定义显示抛出错误，携带错误信息, 失败时返回所有剩余 gas 并恢复状态
 * assert: 用检测不变量内部和测试断言， 失败时消耗剩余 gas 并恢复状态
*/
contract LoopBranch {
    uint256 public numberVar;
    uint256[] public numbers;

    error arrayIndexOutOf(uint256 index);

    constructor(uint256 _numberVar){
        numberVar = _numberVar;
    }

    function setNumberVar(uint256 _numberVar) public {
        if (_numberVar > 50) {
            require(_numberVar > 100, "number var must be more than fifty");
            numberVar = _numberVar;
        } else {
            console.log("number var error");
        }
    }

    function addNumbers(uint256 _count) public {
        for (uint i = 0; i < _count; i++) {
            numbers.push(i);
        }
    }

    function getNumber(uint256 index) public view returns(uint256) {
        // require(numbers.length > index, "index is larger than numbers array length");
        revert arrayIndexOutOf(index);
        return numbers[index];
    }
}
