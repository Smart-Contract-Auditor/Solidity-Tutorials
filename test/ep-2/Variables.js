const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Variables", function () {

    let variablesContract;
    before("Should deploy the variables contract.", async () => {
        variablesContract = await (await ethers.getContractFactory("Variables")).deploy();
        const address = await variablesContract.getAddress();
        expect(address).length(42);
    });

    it("Should send ether and print all the console logs from doSomething().", async () => {
        await variablesContract.doSomething({ value: ethers.parseEther("1") });
        expect(true).to.be.true;
    });

    it("Should pass all the assert statements in doSomethingElse().", async () => {
        await variablesContract.doSomethingElse();
        expect(true).to.be.true;
    });
});
