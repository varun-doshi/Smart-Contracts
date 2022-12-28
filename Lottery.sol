// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract Lottery{
    address payable[] public players;
    address manager;
    mapping (uint256=>address) public allWinners;
    uint lotteryID;

    constructor(){
        manager=msg.sender;
        lotteryID=1;

    }
    modifier onlyManager{
        require(msg.sender==manager,"You do not have access");
        _;
    }

    function enterLottery() external payable{
        require(msg.value==1 ether,"Please pay 1 ether");
        players.push(payable(msg.sender));
    }

    
    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function allPlayers() public view returns(address payable[] memory){
        return players;
    }

    function random() internal view returns(uint){
        return uint(keccak256(abi.encodePacked(block.difficulty,block.timestamp,players.length)));
    }

    function getWinner() public onlyManager {
        require(players.length>=3,"Minimum number of players should be 3");

        uint r=random();
        uint index=r%players.length;

        players[index]=players[index];
        players[index].transfer(getBalance());
        allWinners[lotteryID]=players[index];
        lotteryID++;
        players=new address payable [](0);
    }
}