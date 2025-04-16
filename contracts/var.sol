// SPDX-License-Identifier: UNLICENSED

/*
 * 全局变量：是合约里面预定义一些变量，例如 msg.sender, block.number, block.timestamp, 不需要定义即可以使用
 * 局部变量：在函数中定义的变量，仅在函数调用期间存在，存储在内存中
 * - 不会存储在区块链中，修改不需要 Gas
 * - 生命周期仅限于函数的执行周期
 * - 不能声明为 public 或 external
 * 状态变量：存储在合约的区块链存储中，属于全局变量，生命周期与合约一致
 * - 默认存储在区块链的永久存储中
 * - 修改状态变量需要支付 Gas
 * - 默认具有合约的全局可访问性
 * - 可以用修饰符修饰，如果不修饰默认是 public
*/

/*
 * solidity 变量存储的方式
 * - storage: 永久存储在区块链上的变量, 持久化存储，修改需要支付 Gas, 默认情况下，状态变量存储在 storage 中。
 * - memory: 临时存储在内存中的变量，仅在函数调用期间存在
 * -  适用场景：
 *     - 函数内部的局部变量（默认类型是值类型）
 *     - 用于传递复杂数据类型（如数组和结构体）
 *  - 特性：
 *     - 生命周期短，修改无需支付 Gas。
 *      - 显式使用 memory 关键字声明。
 * - calldata: 专用于 external 函数的输入参数，存储在调用数据中
 * - 适用场景：
 *     - 接收外部调用的函数参数。
 * - 特性：
 *  - 不可修改，具有只读特性。
 *  - 用于优化 Gas 成本。
 */

/*
- 基于栈的架构：
  - 栈是一个 后进先出（LIFO） 的数据结构。
  - 所有计算操作（如加法、乘法）都从栈顶弹出操作数，计算结果再压入栈顶。
- 高效：
  - 栈操作非常快速，因为只需在栈顶进行插入（push）和弹出（pop）。
- 临时性：
  - 栈中的数据仅在当前执行上下文中有效，执行结束后自动销毁。
- 大小限制：
  - 每个栈的深度最多为 1024 个槽位。
  - 如果栈的深度超过限制，将触发运行时错误（StackOverflow）。
  ```
  function complexFunction(uint a, uint b, uint c, uint d, uint e, uint f, uint g) public pure {
    uint h = a + b + c + d + e + f + g + a + b + c + d + e + f + g;
}
  ```
- 栈的计算过程
function calculate(uint a, uint b) public pure returns (uint) {
    return (a + b) * 2;
}
- 在 EVM 中，执行逻辑如下：
  - PUSH1 将 a 压入栈。
  - PUSH1 将 b 压入栈。
  - ADD 弹出 a 和 b，将结果压入栈。
  - PUSH1 将 2 压入栈。
  -  MUL 弹出结果和 2，计算并将最终结果压入栈。
- 减少栈深的优化
function add(uint a, uint b) internal pure returns (uint) {
    return a + b;
}

function multiply(uint a, uint b) internal pure returns (uint) {
    return a * b;
}

function calculate(uint a, uint b) public pure returns (uint) {
    uint sum = add(a, b);
    return multiply(sum, 2);
}
*/

contract Var {
    address public msgSender;
    uint256 public execBlockNumber;

    constructor() {
        msgSender = msg.sender;
    }

    function execute(uint256 _data) public {
        uint256 temp = _data;
        execBlockNumber = block.number;
    }

    function complexFunction(uint a, uint b, uint c, uint d, uint e, uint f, uint g) public pure {
        uint h = a + b + c + d + e + f + g + a + b + c + d + e + f + g;
    }
}
