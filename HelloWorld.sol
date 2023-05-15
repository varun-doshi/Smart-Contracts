//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract helloWorld{

// State variable called "text" to store string
    string public text;
   
//Constructor function to initialize value of variable.
    constructor(string memory _text){
        text=_text;
    }
    
//Function to set new value to variable    
    function setText(string memory newText) public{
        text=newText;
    }
    
////Function to fetch new value to variable (by default all public variables have this function)
    function getText() public view returns(string memory){
        return text;
    }
}
