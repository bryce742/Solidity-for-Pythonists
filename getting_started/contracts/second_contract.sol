// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract SimpleProfile {
    //state variables
    address public owner;
    string public name;
    uint256 public favoriteNumber;

    //constructor (runs once at deployment)
    constructor(string memory _name, uint256 _favoriteNumber) {
        owner = msg.sender; // address of tx creator
        name = _name;
        favoriteNumber = _favoriteNumber;
    }

    //functions
    function setName(string memory _newName) public {
        require(msg.sender == owner, "Not owner, Not allowed!")
        name = _newName;
    }

    function setFavoriteNumber(uint256 _newFavoriteNumber) public {
        favoriteNumber = _newFavoriteNumber;
    }

    function getSummary() public view returns (address, string memory, uint256) {
        return (owner, name, favoriteNumber);
    }


}