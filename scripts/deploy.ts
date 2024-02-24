import { ethers } from "hardhat";

async function main() {
  const votePollFactory = await ethers.deployContract("VotePollFactory");

  await votePollFactory.waitForDeployment();

  console.log(`Contract deployed to ${votePollFactory.target}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
