// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

import "./VotePoll.sol";

contract VotePollFactory {
    VotePoll[] votePollClones;

    function createVotePoll()
        external
        returns (VotePoll newVotePoll_, uint256 length_)
    {
        newVotePoll_ = new VotePoll();

        votePollClones.push(newVotePoll_);
        length_ = votePollClones.length;
    }

    function getVotePollClones() external view returns (VotePoll[] memory) {
        return votePollClones;
    }
}
