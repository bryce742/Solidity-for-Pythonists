

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


### Deploy and Run Transactions
#### Environment
- compile environment vs deployment environmnet?

##### Choosing a Virtual Machine or Environment
__
- Browser Extension
- Remix VM
- VM Fork
- Dev
- Base
- WalletConnect
- Custom -- External HTTP Provider

___
- Osaka
- Prague
- Cancun
- Shanghai
- Paris
- London
- Berlin

##### You start out with a bunch of testnet accounts on Ethereum!
- add/import wallets
- explain more and how this is used

#### Deploy (does so based on the environment?)
- select a (compiled?) contract
- value for wei
- Gas limit
- Deploy button (Creates a tx and interacts with the contract or deploys it? what is the difference?


#### Deployed Contracts
- once contracts are deployed, they can be interacted with (via transactions?)



#### Transactions recorder
- explain


### Git



### Plugin Manager



## The Workspace



## Top Panels



## Other Stuff to know about remix

