// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

interface IInterfaceLearn {
    function getValue() external view returns (uint256);
    function setValue(uint256 _value) external;
}
