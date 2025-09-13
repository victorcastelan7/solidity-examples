// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import {PriceConverter} from "./PriceConverter.sol";

error NotOwner();

contract FundMe {
  address public immutable i_owner;

  constructor() {
    i_owner = msg.sender;
  }

  using PriceConverter for uint256;

  uint256 public constant MINIMUM_USD = 5e18;

  address[] public funders;
  mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

  function fund() public payable {
    require(msg.value.getConversionRate() > MINIMUM_USD, "Must send greater than 5 USD");
    funders.push(msg.sender);
    addressToAmountFunded[msg.sender] += msg.value;
  }

  function withdraw() public onlyOwner {

    for(uint256 index = 0; index < funders.length; index++) {
      address funderAddress = funders[index];
      addressToAmountFunded[funderAddress] = 0;
    }

    funders = new address[](0);

      // payable(msg.sender).transfer(address(this).balance);
    (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
    require (callSuccess, "call failed");
  }

    modifier onlyOwner() {
    if(msg.sender != i_owner) {revert NotOwner();}
    _;
  }

  receive() external payable {
    fund();
  }

  fallback() external payable {
    fund();
  }

}

