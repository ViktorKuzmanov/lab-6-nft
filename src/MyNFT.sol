// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyNFT is ERC721URIStorage, Ownable {
    uint256 public tokenCounter;

    constructor(address initialOwner) Ownable(initialOwner) ERC721("MyNFTCollection", "MNFT") {
        tokenCounter = 1; // Start token IDs from 1
    }

    function mintNFT(address recipient, string memory tokenURI) public returns (uint256) {
        uint256 newTokenId = tokenCounter;
        _mint(recipient, newTokenId);                
        _setTokenURI(newTokenId, tokenURI);          
        tokenCounter += 1;
        return newTokenId;
    }

    function mintBatchNFT(address recipient, uint256 numberOfTokens, string[] memory tokenURIs) public returns (uint256[] memory) {
        require(tokenURIs.length == numberOfTokens, "Treba da ima ist broj na tokeni i URI");

        uint256[] memory newTokenIds = new uint256[](numberOfTokens);

        for (uint256 i = 0; i < numberOfTokens; i++) {
            uint256 newTokenId = tokenCounter;
            _mint(recipient, newTokenId);            
            _setTokenURI(newTokenId, tokenURIs[i]);  
            newTokenIds[i] = newTokenId;
            tokenCounter += 1;
        }

        return newTokenIds;
    }
}
