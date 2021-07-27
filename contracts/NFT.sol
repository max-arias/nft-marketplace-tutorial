// contracts/NFT.sol
// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity ^0.8.3;

// Import utilities and base contracts from openzeppelin
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

import "hardhat/console.sol";

contract NFT is ERC721URIStorage {
    // TODO: What is "using"
    // What is Counters?
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    address contractAddress;

    // TODO: ERC721 modifier?
    constructor(address marketplaceAddress) ERC721("Metaverse Tokens", "METT") {
        contractAddress = marketplaceAddress;
    }

    function createToken(string memory tokenURI) public returns (uint) {
        // Increment number of tokens?
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();

        // Methods from the ERC 271 fromm OpenZeppelin: https://docs.openzeppelin.com/contracts/2.x/api/token/erc721
        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        setApprovalForAll(contractAddress, true);
        return newItemId;
    }
}
