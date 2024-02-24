// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract VotePoll {
    address Admin;

    uint deadline;
    uint duration = 1 days; // 1 Day

    mapping(string => uint) votes;
    mapping(address => bool) hasVoted;
    string[] voteOptions;

    constructor() {
        Admin = msg.sender;
        deadline = block.timestamp + duration;
    }

    // Add to the pool
    function addVoteOptions(string calldata _question) public {
        voteOptions.push(_question);
    }

    // Collate result
    function getResult(string calldata _name) public view returns (uint) {
        return votes[_name];
    }

    // A fuction to view list of votes
    function voteList() public view returns (string[] memory) {
        return voteOptions;
    }

    function castVote(string memory _candidate) public {
        require(block.timestamp >= deadline);
        require(!hasVoted[msg.sender], "Can not vote twice");
        votes[_candidate]++;
        hasVoted[msg.sender] = true;
    }
}
