

# Getting Started

## How do we run solidity files?
- unlike Python, solidity code cannot be run directly from a file

Smart Contracts (solidity scripts) must be:
1. Compiled
2. Deployed to the blockchain (devnet/testnet/mainnet)

They can then be...

3. Interacted with through transactions/calls
- think of the deployed contracts/solidity scripts as objects that have been deployed. these objects have attributes (transactions) and methods (transactions)

### We need a way to compile the solidity code, deploy contracts (scripts), test functions, and observe state changes

#### Remix is a browser-based Solidity development environment that provides:
- a solidity compiler
- a simulated blockchain (for ...)
- a UI for interacting with and calling contracts (via tx?)
- instant feedback/testing

# Remix IDE Tutorial
1. Open Remix: **https://remix.ethereum.org**

## Remix Side Panel/Options
### File Explorer
- contains the files and folders in the current workspace/working environmnet
- this is where you do ...
#### By default, Remix Projects ususally start with: (explain slightly)
./contracts
./scripts
./tests
.prettierrc.json
README.txt
remix.config.json
remix.config1.json


### Search Feature
- allows you to search for text in files?


### Solidity Compiler
- turns the .sol files into bytecode (compiles them)
#### You can specify which compiler you want to use and how it works
- explain how the compiler versions and names for them work
- include nighly builds??
- Auto compile?
- hide warnings?

You basically end up selecting the .sol file to compile, and can either just comile to the executable contract, or compile & run the executable all in one go

##### Advanced Configurations




## The Workspace



## Top Panels



## Other Stuff to know about remix

