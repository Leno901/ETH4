// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Context.sol";

contract DegenGamingToken is ERC20, Ownable {
    struct Item {
        string name;
        uint256 cost;
    }

    mapping(uint256 => Item) public items;

    mapping(uint256 => bool) public itemAvailability;

    // Event to track minting of in-game items
    event MintItem(address indexed recipient, uint256 itemId, uint256 amount);

    constructor(address initialOwner) ERC20("Degen", "DGN") Ownable(initialOwner) {
        addItemToStore(1, "Sword", 1);
        addItemToStore(2, "Shield", 2);
    }

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    function mintItem(address to, uint256 itemId, uint256 amount) external onlyOwner {
        require(itemAvailability[itemId], "Item is not available in the store");
        _mint(to, amount);
        emit MintItem(to, itemId, amount);
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        _transfer(_msgSender(), to, amount);
        return true;
    }

    function redeem(uint256 itemId) external {
        address sender = _msgSender();
        require(itemAvailability[itemId], "Item is not available in the store");
        require(balanceOf(sender) >= items[itemId].cost, "Insufficient balance");

        // Burn the redeemed tokens
        _burn(sender, items[itemId].cost);
    }

    function checkBalance(address account) external view returns (uint256) {
        return balanceOf(account);
    }

    function burn(uint256 amount) external {
        _burn(_msgSender(), amount);
    }

    // Owner function to add items to the in-game store
    function addItemToStore(uint256 itemId, string memory itemName, uint256 itemCost) public onlyOwner {
        items[itemId] = Item(itemName, itemCost);
        itemAvailability[itemId] = true;
    }

    // Owner function to remove items from the in-game store
    function removeItemFromStore(uint256 itemId) external onlyOwner {
        delete items[itemId];
        itemAvailability[itemId] = false;
    }
}

