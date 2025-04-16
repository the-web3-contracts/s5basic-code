const {
    time,
    loadFixture,
} = require("@nomicfoundation/hardhat-toolbox/network-helpers");
const { anyValue } = require("@nomicfoundation/hardhat-chai-matchers/withArgs");
const { expect } = require("chai");
const {address} = require("hardhat/internal/core/config/config-validation");


describe("MappingLearn", function () {
    async function deployMappingLearnFixture() {
        const [owner, otherAccount] = await ethers.getSigners();
        const mappingLearn = await ethers.getContractFactory("MappingLearn");
        const challengePeriod = (await time.latest()) + 3600;
        const mapLearn = await mappingLearn.deploy(challengePeriod);
        return {mapLearn, owner, otherAccount};
    }

    describe("BalanceSetAndGet", function () {
        it("Should set balance and get balance", async function () {
            const { mapLearn, owner, otherAccount } = await loadFixture(deployMappingLearnFixture);
            console.log("owner address====", owner.address)
            const beforeValue = await mapLearn.getBalance(owner.address)
            console.log("before value====", beforeValue)
            await mapLearn.setBalance(owner.address, 20)
            const afterValue = await mapLearn.getBalance(owner.address)
            console.log("after value====", afterValue)

            const version = await mapLearn.version()
            const challengePeriod = await mapLearn.challengePeriod()

            console.log("version====", version)
            console.log("challengePeriod====", challengePeriod)
            // await mapLearn.updateChallengePeriod((await time.latest()) + 3600)
        });
    })
})

