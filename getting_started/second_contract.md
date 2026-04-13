# The Second Contract
Our first contract walkthrough taught:
- contracts as blueprints
- state variables
- variable visibility
- compilation
- deploying to a network
- read-only interaction

We will now look at:
- functions
- parameters
- changing state
- view
- msg.sender
- constructor
- multiple state variables



## Explaining the syntax
- 3 public state variables
- 1 constructor
- 3 functions

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20

contract SimpleProfile {
    //state variables
    address public owner;
    string public name;
    uint256 public favoriteNumber;

    //constructor
    constructor() {

    }

    //functions
    function setName() public {

    }

    function setFavoriteNumber() public {

    }

    function getSummary() public view returns () {

    }

}
```

### The state variables
```solidity
//dtype visibility name
address public owner;
string public name;
uint public favoriteNumber;
```
#### Variable Data Types

##### Standard/Foundational Numerical Data Types
- uint256 (unsigned integer, 256 bytes?)
- floats, signed ints, what else?


##### Non-Numeric data types
string
- similar to python string? array of characters?

##### Datatypes unique to solidity
The **address** datatype:



#### Variable visibility
- if it is public, it is given a getter() function that can be called on the deployed instance of the contract!

#### variable Scope
- talk more about laater


