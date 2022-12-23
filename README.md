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
