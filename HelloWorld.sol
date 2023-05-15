//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract helloWorld{
    string public text;
    constructor(string memory _text){
        text=_text;
    }
    function setText(string memory newText) public{
        text=newText;
    }
    function getText() public view returns(string memory){
        return text;
    }
}