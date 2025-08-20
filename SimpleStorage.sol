//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19; 

contract SimpleStorage {
    uint256 public myFavouriteNumber;

    // Struct including a person with number and name
    struct Person {
        uint256 favouriteNumber;
        string name;
    }

    // Array of person structs
    Person[] public listOfPeople;

    // Mapping from names to favourite numbers
    mapping(string => uint256) nameToFavouriteNumber;

    // Stores a new favourite number (virtual for potential overriding)
    function store(uint256 _favouriteNumber) public virtual {
        myFavouriteNumber = _favouriteNumber;
    }

    //Retrieves the current favourite number
    function retrieve() public view returns(uint256) {
        return myFavouriteNumber;
    }

    // Adds a new person to storage (including name and favourite number)
    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        Person memory newPerson = Person(_favouriteNumber, _name);
        // Add the new person to array
        listOfPeople.push(newPerson);

        //Update mapping
        nameToFavouriteNumber[_name] = _favouriteNumber;
    }
}
