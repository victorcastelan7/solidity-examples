// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import {SimpleStorage} from "./SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage {
  function setFavoriteNumber(uint256 _number) public override {
    myFavoriteNumber = _number + 5;
  }
}