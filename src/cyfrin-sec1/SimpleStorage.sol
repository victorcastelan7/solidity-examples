// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract SimpleStorage {

  uint256 public myFavoriteNumber;

  struct Person {
    uint256 favoriteNumber;
    string name;
  }

  Person[] public favoriteNumbers;

  mapping(string => uint256) public nameToFavoriteNumber;

  function setFavoriteNumber(uint256 _myFavoriteNumber) public {
    myFavoriteNumber = _myFavoriteNumber;
  }

  function returnFavoriteNumber() public view returns(uint256) {
    return myFavoriteNumber;
  }

  function addFavoriteNumber(uint256 _number, string memory _name) public {
    favoriteNumbers.push( Person(_number, _name) );
    nameToFavoriteNumber[_name] = _number; 
  }
  
}