// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";

contract FundMeTest is Test {    
  FundMe fundMe;

  function setUp() external{
    //fundMe = new FundMe();
    DeployFundMe deployFundMe = new DeployFundMe();
    fundMe = deployFundMe.run();
  }

  function testMinimumDollarIsFive() public view {
    assertEq(fundMe.MINIMUM_USD(), 5e18);
  }

  function testOwnerIsMsgSender() public view {
    console.log(address(this));
    console.log(fundMe.i_owner());
    assertEq(fundMe.i_owner(), msg.sender);
  }

}