// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

import "./VotePoll.sol";

interface IVotePollFactory {
    function createVotePoll()
        external
        returns (VotePoll newVotePoll_, uint256 length_);

    function getVotePollClones() external view returns (VotePoll[] memory);
}
