// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {
  using PriceConverter for uint256;

  uint256 public minimumUSD = 5e18;

  address[] public funders;
  mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

  function fund() public payable {
    require(msg.value.getConversionRate() > minimumUSD, "Must send greater than 5 USD");
    funders.push(msg.sender);
    addressToAmountFunded[msg.sender] += msg.value;
  }

  function withdraw() public {

    for(uint256 index = 0; index < funders.length; index++) {
      address funderAddress = funders[index];
      addressToAmountFunded[funderAddress] = 0;
    }
  }
}

