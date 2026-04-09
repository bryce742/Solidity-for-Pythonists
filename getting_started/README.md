# Getting Started with Remix IDE

## Terminology

## The Basic Workflow
1. Create/open a .sol file
2. Compile it
3. Choose a deployment environment
4. Deploy the contract
5. Interact with the deployed contract


## Opening remix for the first time
- **remix** is a playground for contracts/testing
- **local repo** for saving work
- **GitHub** for backup/file history
### The workspace contains project files
It is where we create contracts (write .sol files and scripts) and organize files. Workspaces are saved in the browser (IndexedDB / local storage), meaning that files will persist when we referesh, BUT you can lose everything if clearing the browser data or switching devices.
#### Saving Remix Work
Option 1: copy and paste into a local repo when finished with a file/directory

Option 2: Download the workspace in remix
- right click in the file explorer space, and then 'download'. this will give you a zip file containing all the folders/files for the workspace

Option 3: connect remix to GitHub via plugin
- we can sync directly to github, but will worry about this later 



### Typical starting workspace  
contracts/  
scripts/  
tests/  

## Writing our first line of solidity code
- at the top of all .sol files, we always specify the compiler by using `pragma solidity`. what follows defines the version contraint that **pragma solidity** initially tells the compiler

 command, passing in the compiler to use (as a pattern/version constraint)
- in the solidity compiler tab, you see this drop down of the latest versions! use the highest one in the drop down that is not a nightly version

It looks like the latest non-nightly named version is 0.8.35

```solidity
pragma solidity 0.8.35 // exactly uses this version
```
0.8.35
│ │  └── patch
│ └──── minor
└────── major

####  We can instruct to use a pattern of availible versions
Using a certain version or newer with ^  
```
pragma solidity ^0.8.30; # use 0.8.30 or newer that doesn't break compatibility
```
- 0.8.30 is allowed
- 0.8.31 is allowed 
...

Using a range of versions
```solidity
pragma solidity >=0.8.0 <0.9.0; // uses any version 0.8 patch
```

# Our first solidity file
in the file explorer tab...
1. create a new blank workspace
2. create a file called first_contract.sol (ignore other files for now)
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract VersionTest {
    uint public x;
}

```
## This solidity file contains instructions for a contract (think class). This contract stores a state variable (of type uint and public) named x

3. Compiling the .sol file
Now that we have a complete first_contract.sol file, go to the compiler tab (left hand side), choose the latest non-night compiler, and click compile

- a deployed contract is an instance created from compiled solidity/contract code

## The Solidity code is now compiled into bytecode/abi. Let's explore what happened!
The compiler program takes in a solidity file, and outputs Bytecode and ABI 
.sol file -- compiler --> Output (Bytecode and ABI)

### The Bytecode Output 
- machine code
- **this is what actually gets deployed to the blockcahin**
- we never read/use/interact with this. The blockchain does so for us

### The ABI Output (Application Binary Interface)
The ABI is what provides the **interface** for interacting with the **binary** code

The ABI provides a **structured description of the contract**, telling us:
- what functions exist for it
- the inputs/outputs for those functions
- how to interact with the contract's functions

It is basically a *menu of the contract*


### What does remix show us after we compiled the code?
While still on the compiler tab, we will now see (on the left hand side) a drop down containing depployed contracts 
- what we see is VersionTest (first_contract.sol)
- the pattern is: contract_name (solidity_file_that_created_it)
- you could see how compiling one solidity file could give us many many contracts! we will do this soon

If you click the contract's compilation details, you'll see the ABI, Bytecode, compiler version, and warnings (if any)
- you can see similar on etherscan! explore later

# How the code actually worked
```solidity
contract VersionTest {
    uint public x;
}
```
## The *contract* keyword allows us to define the blueprint for a contract (such as for a class: how to create an instance, what it contains, data, methods, etc.)


contract VersionTest  {
    *definitions and data for the class*
}
~= 
class VersionTest:
    *definitions and data for the class*

## Declaring Variable type, visibility, and name
```solidity
uint public x
```

Datatype for the var: uint (unsigned integer)  
Visibility constraints for the var: public (visible/accessible outside the contract. think scope, look at more later)  
Var name: x

### Creating a variable does much more under the hood!
```solidity
uint public x;
```
Becomes (during compiling etc. more theoretical for now)
```solidity
function x() public view returns (uint) {
    return x; //shows up as a button later
}
```

### We didn't just write a variable, we also:
- stored the state for it on the blockchain
- had a variable getter function automatically created for us (by the ABI?)

### Syntax rules for variables
#### Datatype declaration
- dtype comes first (uint, etc.)
thing uint x; ~ x = int()
#### Visibility keywords
- public: accessible outside the contract, getter method x() automatically created
#### Semi-colons are required at the end of commands/declarations in solidity

# Contracts contain state and functions
We actually created both even though it didn;t look like it! we have the state of x and the getter function x() that was auto-generated for it (under the hood)

## EVERYTHING exists inside of a contract.
There are no free-floating (macro/broader-scoped variables, like in Python)

# Our contract now represents a *deployable state container with built-in access methods*
deployable -- it has been compiled and ready to be deployed to the blockchain!
state container -- we have data for the variable x saved!
built-in access methods -- auto getters()/setters()


# Deploying a compiled contract
## Environment and Ethereum Upgrade Selection
During deployment to the blockchain environment, the contract:
- receives a unique address
- becomes live/real where it can be interacted with

1. Go to the 'Deploy and Run Transactions* tab (below compiler)
2. In the top left 'Environment' section, click the drop down and select to use the **Remix VM** environment for deployment, and the default/latest upgrade (Osaka)

The Remix VM is Remix's built-in browser environment for testing the blockchain contracts without needing to install anything else. It also gives prefunded test accounts! A good development environment.

to the left of that selected dropdown is another smaller drop down for choosing an *Ethereum Network Upgrade Version* (aka a hard fork of Ethereum). these include:
- London
- Paris
- Shanghai
- Cancun
- Prague (future)
- Osaka (future)

These Ethereum Upgrade Versions/Forks change things like:
- gas fees
- availible features 
- Opcodes (lower-level instructions)
- improved performance/efficiency

Different upgrades have different rules!

We are choosing 'Which version of Ethereum rules' that our compiiled contract will run under


### Account Dection
- provides us with a bunch of test/dummy accounts that we can use to interact with the soon to be deployed contract

### Deploy Section
3. Select to the VersionTest contract
- we see a drop down of compiled contracts (included VersionTest, which comes from first_contract.sol). 

#### Gas Control
- come back to later!!
- for now it doesn't really matter since doing the Remix VM

## Deployment
4. Click deploy!
- when we click deploy, Remix sends a transaction to the current environment (Remix VM that we see locally)
- the sent transaction creates a new ON CHAIN contract, and gives it an address

# The contract has been deployed, what's next?
- we now see this contract under Deployed Contracts! 
- we see that the VersionTest contract has a crap ton more info than what it'd seem like based on our code! In our environment/workspace we see the summary for the transaction that deployed the contract (the details, which we can ignore for now)

5. use the x() getter method for the deployed contract!
- returns the value for x
- remember that we have this getter() button for it because this variable was set to public visibility!
- x() is a read-only call 
- returns uint 0 since we have not set it yet!