# SimpleStorage & StorageFactory Contracts

My beginner friendly Solidity project demonstrating the basic smart contract functionality, including state management, structs, arrays, mappings, and contract factory patterns.

## 📋 Table of Contents
- [Overview](#overview)
- [Contracts](#contracts)
  - [SimpleStorage](#simplestorage)
  - [StorageFactory](#storagefactory)
- [Getting Started](#getting-started)
  - [Installation](#installation)
  - [Compilation](#compilation)
  - [Testing](#testing)
- [Usage](#usage)
  - [Interacting with SimpleStorage](#interacting-with-simplestorage)
  - [Interacting with StorageFactory](#interacting-with-storagefactory)
- [Project Structure](#project-structure)
- [Author](#author)
- [Acknowledgements](#acknowledgements)
- [Contributing](#contributing)
- [License](#license)

## Overview

This project contains two Solidity smart contracts that demonstrate the fundamental Ethereum development concepts:

- **SimpleStorage**: A basic contract that stores and retrieves numbers, and manages a list of people with their favorite numbers
- **StorageFactory**: A factory contract that creates and manages multiple instances of SimpleStorage contracts

These contracts are ideal for learning Solidity and cover essential concepts like:
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

## Project Structure

```
project-root/
│
├── contracts/
│   ├── SimpleStorage.sol
│   └── StorageFactory.sol
│
├── scripts/
│   ├── deploy.js (optional)
│   └── interact.js (optional)
│
└── README.md
```

## Author

**JESSE**  
*Beginner Solidity Developer*  
- Learning blockchain development and smart contract programming
- Exploring the Ethereum ecosystem

## Acknowledgements

This project was built during my learning phase with guidance from excellent educational resources:

- **[Cyfrin Updraft](https://updraft.cyfrin.io/)**: For their comprehensive smart contract development courses
- **[Patrick Collins](https://twitter.com/PatrickAlphaC)**: For his exceptional teaching style and making complex concepts accessible to beginners
- The entire Cyfrin team for creating valuable learning materials for the Web3 community

Special thanks to the open-source community and all the developers who share their knowledge to help others learn and grow.

## Contributing

This is a learning project, but if you'd like to suggest improvements:
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request


