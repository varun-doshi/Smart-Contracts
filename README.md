# Smart-Contracts

This Repository contains compiled Smart Contracts.

## 1. ERC-721 Token Standard
### [Check the code here](https://github.com/varun-doshi/Smart-Contracts/blob/main/Vjacs.sol) <br/>
The Contract contains the following functions:
* `publicMint()` :Mint function for the general public
* `allowListMint()` :Mint function for the addresses on the AllowList public
* `internalMint()` :Internal function for common operations.
* `chngMintWindow()` :For turning Public and AllowList Minting on/off.
* `addToAllowList()` :For adding addresses to the AllowList.
* `withdraw()` :For withdrawing contract balance.
* `_pause()` :For pausing all transactions.
* `_unpause()` :For resuming all transactions.



## 2. Lottery Contract using Hash Function
### [Check the code here](https://github.com/varun-doshi/Smart-Contracts/blob/main/Lottery.sol)
This is a Lottery Contract where users can participate by putting in a specified amount of Ether. <br/>
This contract requires a minimum of 3 players before the Lottery can start. <br/>
<br/>
Functions in the contract:
* `enterLottery()` : Users can enter the lottery by paying 1 Ether.
* `getBalance()` : The balance in the contract is publicly viewable by everyone.
* `allPlayers()` : Participating players are publicly viewable by everyone.
* `random()` : Internal function that uses Hash Function Keccak256 to get a random number.
* `getWinner()` : Called by Manager to find the winner of the lottery and transfer the Eth to respective address.
