// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "./interface/IInterfaceLearn.sol";

contract InterfaceLearn is IInterfaceLearn {
    uint256 public value;

    constructor(){
    }

    function getValue() external view returns (uint256) {
        return value;
    }

    function setValue(uint256 _value) external {
        value = _value;
    }
}
