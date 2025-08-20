# SimpleStorage & StorageFactory Contracts

A beginner-friendly Solidity project demonstrating basic smart contract functionality, including state management, structs, arrays, mappings, and contract factory patterns.

## 📋 Table of Contents
- [Overview](#overview)
- [Contracts](#contracts)
  - [SimpleStorage](#simplestorage)
  - [StorageFactory](#storagefactory)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Compilation](#compilation)
  - [Testing](#testing)
- [Usage](#usage)
  - [Interacting with SimpleStorage](#interacting-with-simplestorage)
  - [Interacting with StorageFactory](#interacting-with-storagefactory)
- [Code Explanation](#code-explanation)
  - [SimpleStorage Breakdown](#simplestorage-breakdown)
  - [StorageFactory Breakdown](#storagefactory-breakdown)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [License](#license)

## Overview

This project contains two Solidity smart contracts that demonstrate fundamental Ethereum development concepts:

- **SimpleStorage**: A basic contract that stores and retrieves numbers, and manages a list of people with their favorite numbers
- **StorageFactory**: A factory contract that creates and manages multiple instances of SimpleStorage contracts

These contracts are ideal for beginners learning Solidity and cover essential concepts like:
- State variables and visibility
- Functions and function modifiers
- Structs, arrays, and mappings
- Contract deployment and interaction
- Basic inheritance (virtual functions)

## Contracts

### SimpleStorage

The SimpleStorage contract provides basic storage functionality with the following features:

- Store and retrieve a single number
- Add people with names and their favorite numbers
- Track all added people in an array
- Look up favorite numbers by name using a mapping

### StorageFactory

The StorageFactory contract demonstrates the factory pattern by:

- Creating multiple instances of SimpleStorage contracts
- Keeping track of all created contracts
- Providing functions to interact with any created contract

## Getting Started

### Prerequisites

To work with these contracts, you'll need:

- [Node.js](https://nodejs.org/) (v16 or higher)
- [npm](https://www.npmjs.com/) or [yarn](https://yarnpkg.com/) package manager
- A code editor like [VS Code](https://code.visualstudio.com/) with Solidity support

### Installation

1. Clone or download this project
2. Install dependencies (if using a development framework like Hardhat or Truffle)
3. Set up your development environment

For a simple test environment, you can use [Remix IDE](https://remix.ethereum.org/):
- Go to https://remix.ethereum.org/
- Create a new file named `SimpleStorage.sol` and paste the first contract
- Create another file named `StorageFactory.sol` and paste the second contract

### Compilation

If using Remix:
1. Open the Solidity compiler plugin
2. Select compiler version 0.8.19 or higher
3. Compile each contract separately

If using a local development environment:
```bash
# Example using Hardhat
npx hardhat compile
```

### Testing

While this project doesn't include tests, you can deploy and test the contracts:

1. Deploy SimpleStorage first
2. Then deploy StorageFactory (pointing to the SimpleStorage address if needed)
3. Use the provided functions to interact with the contracts

## Usage

### Interacting with SimpleStorage

After deploying SimpleStorage, you can:

1. **Store a number**: Call `store()` with any uint256 value
2. **Retrieve the number**: Call `retrieve()` to get the stored value
3. **Add a person**: Call `addPerson()` with a name and favorite number
4. **View people**: Check the `listOfPeople` array to see all added persons
5. **Look up by name**: Use the `nameToFavouriteNumber` mapping to find a person's favorite number by name

### Interacting with StorageFactory

After deploying StorageFactory, you can:

1. **Create new SimpleStorage contracts**: Call `createSimpleStorageFactory()` to deploy new instances
2. **Access created contracts**: View all created contracts in the `listOfSimpleStorageContracts` array
3. **Interact with specific contracts**: Use `sfStore()` and `sfGet()` with the contract index to modify and read values

## Code Explanation

### SimpleStorage Breakdown

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SimpleStorage {
    // Public state variable
    uint256 public myFavouriteNumber;
    
    // Struct definition
    struct Person {
        uint256 favouriteNumber;
        string name;
    }
    
    // Dynamic array of Person structs
    Person[] public listOfPeople;
    
    // Mapping from name to favorite number
    mapping(string => uint256) public nameToFavouriteNumber;
    
    // Function to store a number (virtual for potential overriding)
    function store(uint256 _favouriteNumber) public virtual {
        myFavouriteNumber = _favouriteNumber;
    }
    
    // Function to retrieve the stored number
    function retrieve() public view returns (uint256) {
        return myFavouriteNumber;
    }
    
    // Function to add a new person
    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        // Create a new Person in memory
        Person memory newPerson = Person(_favouriteNumber, _name);
        // Add to array
        listOfPeople.push(newPerson);
        // Update mapping
        nameToFavouriteNumber[_name] = _favouriteNumber;
    }
}
```

### StorageFactory Breakdown

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// Import the SimpleStorage contract
import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
    // Array to store all created SimpleStorage contracts
    SimpleStorage[] public listOfSimpleStorageContracts;
    
    // Function to create a new SimpleStorage contract
    function createSimpleStorageFactory() public {
        // Deploy a new SimpleStorage contract
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        // Add it to our tracking array
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }
    
    // Function to store a value in a specific SimpleStorage contract
    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        // Get reference to the contract at the specified index
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        // Call the store function on that contract
        mySimpleStorage.store(_newSimpleStorageNumber);
    }
    
    // Function to get a value from a specific SimpleStorage contract
    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        // Get reference to the contract at the specified index
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        // Call the retrieve function on that contract and return the value
        return mySimpleStorage.retrieve();
    }
}
```

## Project Structure

```
project-root/
│
├── contracts/
│   ├── SimpleStorage.sol
│   └── StorageFactory.sol
│
├── scripts/
│   ├── deploy.js
│   └── interact.js
│
├── test/
│   └── SimpleStorage-test.js
│
├── README.md
└── package.json
```

## Contributing

This is a learning project, but if you'd like to suggest improvements:
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## License

This project is licensed under the MIT License - see the SPDX-License-Identifier in the contract files for details.
