// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SolidityPlaybook is ERC20, ERC20Burnable, Pausable, Ownable {

    uint public totalSupply;                                                        //Tracks total token circulation
    mapping(address => uint) public balanceOf;                                      //Mapping of address to number of tokens user holds
    mapping(address => mapping(address => uint)) public allowance;                  //Mapping for address to amount user is approved for


//Constructor to mint tokens to owner
    constructor() ERC20("SolidityPlaybook", "SP") {
    }


//Used to pause specific functions which are marked as "whenNotPaused"
    function pause() public onlyOwner {
        _pause();
    }

//Resumes all functions
    function unpause() public onlyOwner {
        _unpause();
    }

//Mint tokens to address
    function mint(uint amount) external {
        balanceOf[msg.sender] += amount;
        totalSupply += amount;
        emit Transfer(address(0), msg.sender, amount);
    }

//Function for users to "destroy" their tokens
      function burn(uint amount) external {
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
        emit Transfer(msg.sender, address(0), amount);
    }

//Function to transfer tokens from called to "recipient" 
     function transfer(address recipient, uint amount) external returns (bool) {
        balanceOf[msg.sender] -= amount;
        balanceOf[recipient] += amount;
//Transfer event already defined in ERC20 interface
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

//Approve "spender" to use "amount" of your tokens on your behalf
// Approve funtion is necessary for transferFrom function to run 
       function approve(address spender, uint amount) external returns (bool) {
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

//Approved user "sender" sends "amount" from your account to "recipient"
    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) external returns (bool) {
        allowance[sender][msg.sender] -= amount;
        balanceOf[sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(sender, recipient, amount);
        return true;
    }



    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}