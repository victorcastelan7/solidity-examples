// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
  SimpleStorage[] public simpleStorageContractList;

  function createSimpleStorageContract() public {
    SimpleStorage newSimpleStorageContract = new SimpleStorage();
    simpleStorageContractList.push(newSimpleStorageContract);
  }

  function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
    SimpleStorage mySimpleStorage = SimpleStorage[_simpleStorageIndex];
    mySimpleStorage.setFavoriteNumber(_newSimpleStorageNumber);
  }

  function sfRetrieve(uint256 _simpleStorageIndex) public view returns(uint256) {
    return simpleStorageContractList[_simpleStorageIndex].returnFavoriteNumber();
  }
}