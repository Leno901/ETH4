## DegenGamingToken Smart Contract

## Overview
The DegenGamingToken is a Solidity smart contract that extends the ERC-20 token standard. It represents a gaming token with the ability to mint, transfer, burn, and redeem tokens for in-game items. The contract is designed to be owned by an address, providing control over certain functions to the owner.

Author
John O'nel D. Bulos

## Table of Contents
- Description
- Functions
- Constructor
- Mint Functions
- Transfer Function Override
- Redeem Function
- Check Balance Function
- Burn Function
- Add Item to Store Function
- Remove Item from Store Function
- Events
- MintItem Event
- Usage


## Description
The DegenGamingToken contract introduces the concept of in-game items, each having a name and a cost. The owner of the contract can mint new tokens, mint tokens for specific in-game items, transfer tokens, redeem tokens for items, check balances, and burn tokens. Additionally, the owner can manage the in-game store by adding or removing items.


## Usage
The DegenGamingToken contract can be deployed on the Ethereum blockchain, and users can interact with its functions using Ethereum wallets or scripts. The owner has special privileges to mint tokens, manage the in-game store, and perform other administrative actions.
