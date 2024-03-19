const {
  time,
  loadFixture,
} = require("@nomicfoundation/hardhat-toolbox/network-helpers");
const { anyValue } = require("@nomicfoundation/hardhat-chai-matchers/withArgs");
const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Counter", function () {

  let counterContract;
  before(async () => {
    const counterContractFactory = await ethers.getContractFactory("Counter");
    counterContract = await counterContractFactory.deploy(1);
    const address = await counterContract.getAddress();
    expect(address).length(42);
  });

  it("Should increment counter by one.", async () => {
    await counterContract.increment();
    const counter = await counterContract.counter();
    console.log("Counter is: ", counter);
    expect(counter).equals(2);
  })
});
