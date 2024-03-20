const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Immutables", function () {

let immutablesContract;
  before("Should deploy the immutables contract.", async () => {
    immutablesContract = await (await ethers.getContractFactory("Immutables")).deploy(5);
    const address = await immutablesContract.getAddress();
    expect(address).length(42);
  })

  it("Should get the value of MY_ADDRESS.", async () => {
    const myAddress = await immutablesContract.MY_ADDRESS();
    console.log("myAddress: ", myAddress);
    expect(myAddress).is.a.string;
  })
});
