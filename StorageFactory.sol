//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {

    // Public Array stores all created Simple storage contract
    SimpleStorage[] public listOfSimpleStorageContracts;

    // Creates a new Simple storage contract and adds it to the array
    function createSimpleStorageFactory() public {
        // Deploy new contract
        SimpleStorage newSimpleStorageContract = new SimpleStorage(); 
        // SimpleStorage simpleStorage = new SimpleStorage(); // Alternative 
        // Add to storage array 
        listOfSimpleStorageContracts.push(newSimpleStorageContract); 
    }

    // Updates storage value in a specific simple storage contract
    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        // Gets the contract reference from the array
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        // Call store function
        mySimpleStorage.store(_newSimpleStorageNumber); 
        // listOfSimpleStorageContracts[_simpleStorageIndex].store(_newSimppleStorageNumber); // Alternative
    }

    // Retrieves value from a specific simple storage contract
    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        // Contracts reference
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        // Return stored value
        return mySimpleStorage.retrieve(); 
        // return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve(); // Alternative
    }
}