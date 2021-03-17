// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Lottery {
    address public manager;
    address payable[] public players;

    constructor() {
        manager = msg.sender;
    }

    function enter() public payable {
        require(msg.value > 0.0001 ether);
        players.push(msg.sender);
    }

    function random() private view returns (uint256) {
        return uint256(sha256(abi.encode(block.timestamp)));
    }

    function pickWinner() public payable {
        uint256 index = random() % players.length;
        players[index].transfer(address(this).balance);
    }
}
