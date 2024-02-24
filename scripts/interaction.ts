import { ethers } from "hardhat";

async function main() {
  const votePollFactoryContract = "0x5FbDB2315678afecb367f032d93F642f64180aa3";
  const VOTEPOLLFACTORY = await ethers.getContractAt(
    "IVotePollFactory",
    votePollFactoryContract
  );

  const createVoteTx = await VOTEPOLLFACTORY.createVotePoll();

  await createVoteTx.wait();

  const clones = await VOTEPOLLFACTORY.getVotePollClones();

  console.log(clones);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
