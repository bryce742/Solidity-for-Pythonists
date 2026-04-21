# Solidity-for-Pythonists: Thinking about State, Storage, and, Deterministic Data
A structured Solidity learning repository for Python and SQL-minded developers. Focused on understanding smart contracts as deterministic, stateful systems—covering storage, mappings, events, and querying blockchain data through a data engineering lens.

# Solidity for Pythonists

Thinking in State, Storage, and Deterministic Data

---

## Mental Model

The basic workflow for working with Solidity (.sol) files is:

1. Create or edit a contract
2. Compile it
3. Deploy it to a blockchain
4. Interact with the deployed contract

---

## Key Difference from Python

Unlike Python, Solidity code is NOT run directly.

Smart contracts must be:

1. **Compiled**
2. **Deployed** to a blockchain environment (local VM, testnet, or mainnet)

3. Once they have been deployed, an instance of the contract exists at an address on the network, and can now be interacted with
---

## What is a Smart Contract?

A deployed contract is a **stateful program (or API) living on-chain**.

It is NOT just a temporary script or function.

It has:

* **State variables** → stored data (like a database)
* **Functions** → logic that interacts with that data

---

## Types of Interactions (that you can do on a deployed/live contract)

### Call (Read-only)

* Does NOT change state
* Does NOT cost gas
* Example: reading a public variable

### Transaction (Write)

* Changes state
* Costs gas
* Recorded permanently on-chain
* Example: updating a value or even just deploying a smart contract to the blockchain for the first time! (anything on the blockchain that gets recorded and saved to the 'db' requires a transaction)

---

## Core Workflow

### Write a smart contract in solidity

### Compile

* Converts `.sol` → **bytecode + ABI**

### Deploy

* requires a transaction since it is writing to the blockchain
* Creates a **live instance** of the contract
* Assigns it a **contract address**

### Interact

* Use the ABI/UI to call functions
* Either:

  * Read (call)
  * Write (transaction)

---

## What is the ABI?

The **ABI (Application Binary Interface)** is:

* The interface used to interact with a contract
* Defines:

  * Available functions
  * Inputs and outputs

Think of it like:

> a contract’s API specification

---

## Compiler vs Deployment

* **Compiler environment** ≠ **Deployment environment**

### Compiler

* Must match the contract’s `pragma`
* Use stable versions (avoid nightly builds)

### Deployment Environment

Determines where the contract lives:

* Local (Remix VM)
* Testnet
* Mainnet
* External wallet/provider

---

## Final Intuition

You are not just running a script.

You are:
- deploying a permanent program
- that stores data
- and is interacted with over time (via calls or written transactions)






