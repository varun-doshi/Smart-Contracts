// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Vjacs is ERC721, ERC721Enumerable, Pausable, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;
    uint256 maxSupply=10;
    uint256 maxAllowList=5;

    mapping(address=>bool) allowListAddress;

    bool public publicMintOpen=false;
    bool public allowListMintOpen=false;

    constructor() ERC721("vjacs", "vjs") {}

    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://Qmaa6TuP2s9pSKczHF4rwWhTKUdygrrDs8RmYYqCjP3Hye/";
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function chngMintWindow(bool _publicMintOpen,bool _allowListMintOpen) external onlyOwner{
        publicMintOpen=_publicMintOpen;
        allowListMintOpen=_allowListMintOpen;
    }

    function allowListMint() public payable{
        require(allowListMintOpen,"AllowList Mint closed");
        require(allowListAddress[msg.sender],"You are not on the Allow List");
        require(msg.value==0.001 ether,"Not enough funds");
        internalMint();
    }


    function publicMint() public payable {
        require(publicMintOpen,"Public Mint closed");
        require(msg.value==0.01 ether,"Not enough funds");
        internalMint();
        
    }

    function internalMint() internal{
        require(totalSupply() <maxSupply,"All NFTs minted");
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(msg.sender, tokenId);
    }

    function addToAllowList(address[] calldata allowAddress) external onlyOwner{
        for(uint256 i=0;i<allowAddress.length;i++){
            allowListAddress[allowAddress[i]]=true;
        }
    }

    function withdraw(address addr) external onlyOwner{
        uint256 balance=address(this).balance;
        payable(addr).transfer(balance);
    }

    

    function _beforeTokenTransfer(address from, address to, uint256 tokenId, uint256 batchSize)
        internal
        whenNotPaused
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId, batchSize);
    }

    // The following functions are overrides required by Solidity.

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}