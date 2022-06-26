// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract NftTrader {

    mapping(address => mapping(uint256=> listing)) public listings;
    mapping(address => uint256) public balances;
    struct listing {
        uint256 price;
        address seller;
    }

    function addListing(uint256 price, address contractAddr, uint256 tokenId) public {
        ERC1155 token = ERC1155(contractAddr);
        require(token.balanceOf(msg.sender, tokenId) > 0, "caller must own given token");
        require(token.isApprovedForAll(msg.sender, address(this)), "contract must be approved");
        listings[contractAddr][tokenId] = listing(price, msg.sender);

    }

    function purchase(address contractAddr,uint256 tokenId, uint256 amount) public payable {
        listing memory item = listings[contractAddr][tokenId];
        require(msg.value >= item.price * amount, "insufficient funds sent");
        balances[item.seller] += msg.value;
    }

    function withdraw(uint256 amount, address payable destAddr) public {
        require(amount <= balances[msg.sender],"insufficient funds");

        destAddr.transfer(amount);
        balances[msg.sender] -= amount;
    }



}
