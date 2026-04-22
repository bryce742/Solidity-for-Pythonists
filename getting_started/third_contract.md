
# Before getting into the the third contract, let's discuss data storage and variable types

In Solidity, some types require a **data location** to specify where the data lives.


## Value Type Variables do not require an explicit data location (whether a function parameter or state variable)
- uint256
- bool
- address
- bytes32

## Reference-typed variables require explicit data storage declaration
- string
- bytes
- arrays
- structs
- mappings

The memory keyword explicitly tells solidity to temporarily store an actual copy of the data throughout the function's execution. (often so that it can be used for setting a state variable onchain)

Notice how (in second_contract.sol) we only included the memory keyword when setting our function paramters, and not when we declared a string outside of the function!


```solidity
    string public name;

    function setName(string memory _newName) public {
        name = _newName;
    }
```
_newname is temporary stored into memory so that it can be used (in and during the lifetime of the function) to set the name state variable.

Again, memory is temporary data that **exists only during the function call**. Value types do not require explicit memory declaration, while reference types do.

## Three main data locations

| Location   | Lifetime   | Mutable | Used for                  |
|------------|-----------|--------|----------------------------|
| storage    | permanent | yes    | state variables            |
| memory     | temporary | yes    | function variables         |
| calldata   | temporary | no     | external function inputs   |
---

```storage``` --> **permanent** on-chain storage
- used for state-variables (which, of course, live forever onchain)
- no 'storage' keyword needed. state-variables automatically use storage
- storage = permanent state

```solidity
string public name; // automatically stored in storage
```


```memory``` --> **temporary** memory used to store data (for reference-typed) variables during function execution
- memory is for temporary copies of data
- used inside of functions for non-state variables that are reference-typed



```solidity
string public name;
uint256 public favNum;

function setProfile(string memory _newName, uint256 _newFavNum) {
    string memory tempName = _newName; // a copy of a copy!
    name = tempName;

    favNum = _newFavNum;
}
```

Again, **memory is used to store temporary copies of data during function execution**


```calldata``` --> **read-only external input** 
This area is used to store data for function parameters in EXTERNAL functions
- more gas efficient!!


```solidity
function setNameExternal(string calldata _newName) external {
    name = _newName; //calldata storage --> state var storage
}
```

Again, **calldata is used to store read-only input from outside of the contract** (and therefore, function)


## Data Visibility and keywords
In solidity, visibility defines **who can access what variables and functions**
### Main visibility types:
- `public`
- `private`
- `internal`
- `external`

---

#### Public Variables and Functions
- accessible from outside the contract (anyone can call/get the state varialbe or function return)
- automatically has a getter function created for it
```solidity
uint public x;
```

State-changing public function (anyone can call it, and change state!!)
```solidity
function setName(string memory _newName) public {
    name = _newName;
}
```

Read-Only public function
```solidity
function getName() public view returns (string memory) {
    return name;
}
```

#### Private Variables and Functions
- only accessible inside the contract itself
- the contract's functions may use it, but people cannot call a getter() function to get its value!
- no other contracts can access it (even if the current contract inherits it!)

```solidity
uint private x;
```

#### Internal Variables and Functions
- like private, accessible only inside of the contract
- however, it CAN be accessed by inherited contracts
- still no public getter function for a 'user'

```solidity
uint internal x;
```

#### External Variables and Functions
- can ONLY be called outsid eof the contract
- slightly more gas efficient than ```public``` for external calls

```solidity
uint external x = 5;
```

# third_contract.sol and its syntax
Our contract has 1 public state variable and 2 private state variables. These variables are set at time of deployment via the constructor.

```solidity
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
}


```

Remember that msg.sender is the wallet that deployed the contract!!


`owner` state variable
- anyone will be able to access it directly (no need to make a getter function, as it is already public and one will be made for it)
- no one can change it, not even the 'owner' themselves! It can only be set via the constructor called at time of contract deployment


`name` state variable
- only the owner can change it (anyone can try to call the function since it is public, but thanks to the require statement for the setter, the function would exit execution before changing the state variable if the method caller is not the contract owner)
- no getter method is automaatically created, however, we make a public view function (read-only) that aanyone can call!

```solidity
function setName(string memory _newName) public {
    require(msg.sender == owner, "Only the owner can set the name");
    name = _newName;
}

function getName() public view returns (string memory) {
    return name;
}
```

`favoriteNumber` state variable
- can only be accessed via the created getter function (which is read-only)
- can only be edited by the owner of the contract (thanks to the require statement, giving essentially identical functionality to setName() from earlier)

```solidity
function setFavoriteNumber(uint256 _favoriteNumber) public {
    require(msg.sender == owner, "Only contract owner can change name");
    favoriteNumber = _favoriteNumber;
}

function getFavoriteNumber() public view returns (uint256) {
    return favoriteNumber;
}

```


Adding the state-variable summary function
- anyone can call it!
- read-only function
```solidity
function getSummary() public view returns (address, string memory, uint256) {
    return (owner, name, favoriteNumber);
}
```
