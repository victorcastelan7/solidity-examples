// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";


contract FundMe {
  uint256 public minimumUSD = 5e18;

  address[] public funders;
  mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

  function fund() public payable {
    require(getConversionRate(msg.value) > minimumUSD, "Must send greater than 5 USD");
    funders.push(msg.sender);
    addressToAmountFunded[msg.sender] += msg.value;
  }

  function withdraw() public {}

  function getPrice() public view returns(uint256) {
    AggregatorV3Interface dataFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    (,int256 answer,,,) = dataFeed.latestRoundData();
    return uint256(answer) * 1e10;
  }

  function getConversionRate(uint256 ethAmount) public view returns(uint256) {
    uint256 ethPrice = getPrice();
    return (ethPrice * ethAmount) / 1e18;
  }
}

