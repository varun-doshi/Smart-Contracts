# Smart-Contracts

This Repository contains compiled Smart Contracts.


## 1. Hello World Smart Contract
### [Check the code here](https://github.com/varun-doshi/Smart-Contracts/blob/main/HelloWorld.sol) <br/>
The Contract contains the following functions:
* `setText()` :Set new value of "text" state variable
* `getText()` :Fetch the value of "text" variable

## 2. ERC-721 Token Standard
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


## 3. ERC-20 Token Standard
### [Check the code here](https://github.com/varun-doshi/Smart-Contracts/blob/main/SolidityPlaybook.sol) <br/>
The Contract contains the following functions:
* `mint()` :Mint tokens to address
* `burn()` :Function for users to "destroy" their tokens
* `transfer()` :Function to transfer tokens from called to "recipient" 
* `approve()` :Approve "spender" to use "amount" of your tokens on your behalf
* `transferFrom()` :Approved user "sender" sends "amount" from your account to "recipient"
* `pause()` :Used to pause specific functions which are marked as "whenNotPaused"
* `unpause()` :Resumes all functions



## 4. Lottery Contract using Hash Function
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
