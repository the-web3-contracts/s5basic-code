// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;


/*
 *  - 1 slot 是 32 个字节
 * ---------------------------
 *  - uint256：32 字节
 *  - uint8：1 个字节
 *  - bool: 1 个字节
 *  - address: 20 个字节
 *  - string: 占据空间长度取决于字符串
*/

contract slot01 {
    address public aaa;  // slot 1
    uint8 public f;     // slot 1
    uint256 public a;  // slot 2
    uint8 public b;    // slot 3
    uint8 public c;    // slot 3
    uint256 public d;  // slot 4
}

contract slot02V1 {
   struct SlotStruct {
        uint256  a; // slot 1
        uint8   b; // slot 2
        uint8   c; // slot 2
        uint256  d; // slot 3
   }

   SlotStruct public aa;
   uint256 public d; // slot 4
}

// slot02V2 是从 slot02V1 升级过来的
contract slot02V2 {
    struct SlotStruct {
        uint256  a;
        uint8    b;
        uint8    c;
        uint256  d;
    }
    mapping(uint256 => SlotStruct) public Aaaa;
    uint256 public d; // slot 1
}

contract slot02V3 {
    struct SlotStruct {
        uint256  a;
        uint8    b;
        uint8    c;
        uint256  d;
    }

    uint256 public d;
    SlotStruct[] public Aaaa;
}

contract slot02V4{
    uint8     a;
    uint32    b;
    uint8     c;  // 第二版里面新加的

    uint256 public d;
}

contract A {
    uint256 public d1;
    uint256 public d2;
    uint256 public d3;
}

contract AUpgrade {
    uint256 public d1;
    uint256 public d2;
    uint256 public d3;
    uint256 public e;
    uint256 public e1;

    uint256[98] public slotxx;
}

contract B {
    uint256 public d4;
    uint256 public d5;
    uint256 public d6;

    uint256[100] public slotxx;
}

contract C is A, B {
    uint256 public d7;
    uint256 public d8;
    uint256 public d9;
}
