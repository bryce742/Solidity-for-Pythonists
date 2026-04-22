// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract OwnerProfile {
    address public owner;
    string private name;
    uint256 private favoriteNumber;

    constructor(string memory _name, uint256 _favoriteNumber) {
        owner = msg.sender;
        name = _name;
        favoriteNumber = _favoriteNumber;
    }

    function setName(string memory _newName) public {
        require(msg.sender == owner, "Only contract owner can change name");
        name = _newName;
    }

    function setFavoriteNumber(uint256 _favoriteNumber) public {
        require(msg.sender == owner, "Only contract owner can change name");
        favoriteNumber = _favoriteNumber;
    }

    function getName() public view returns (string memory) {
        return name;
    }

    function getFavoriteNumber() public view returns (uint256) {
        return favoriteNumber;
    }

    function getSummary() public view returns (address, string memory, uint256) {
        return (owner, name, favoriteNumber);
    }
}