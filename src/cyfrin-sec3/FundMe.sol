// SPDX-License-Identifier

pragma solidity 0.8.19;

contract FundMe {
  function fund() public payable {
    require(msg.value > 1e18, "Must send greater than 1 eth");
  }

  function withdraw() {}
}