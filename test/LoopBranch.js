const {
    time,
    loadFixture,
} = require("@nomicfoundation/hardhat-toolbox/network-helpers");
const { anyValue } = require("@nomicfoundation/hardhat-chai-matchers/withArgs");
const { expect } = require("chai");
const {address} = require("hardhat/internal/core/config/config-validation");


describe("LoopBranch", function () {
    async function deployLoopBranchFixture() {
        const [owner, otherAccount] = await ethers.getSigners();
        const loopBranch = await ethers.getContractFactory("LoopBranch");
        const lbranch = await loopBranch.deploy(10);
        return {lbranch, owner, otherAccount};
    }

    describe("setNumber", function () {
        it("Should set number and get number", async function () {
            const { lbranch, owner, otherAccount } = await loadFixture(deployLoopBranchFixture);
            const beforenNmberVar = await lbranch.numberVar()
            console.log("beforenNmberVar====", beforenNmberVar)
            await lbranch.setNumberVar(101)
            const afterNmberVar = await lbranch.numberVar()
            console.log("afterValue====", afterNmberVar)

            await lbranch.addNumbers(10)
            const numberItem = await lbranch.getNumber(1)
            const numberIt = await lbranch.numbers(1)
            console.log("numberItem====", numberItem)
            console.log("numberItem====", numberIt)
        });
    })
})
