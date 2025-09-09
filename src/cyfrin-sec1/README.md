# Cyfrin Solidity Fundamentals — Section 1

## Overview
This section covered Solidity basics:  
- State variables  
- Functions (set/get)  
- Structs & arrays  
- Mappings  

The project was a simple storage contract that allows:  
- Storing and updating a single favorite number  
- Tracking a list of people with their favorite numbers  
- Mapping a person’s name to their favorite number  

---

## Contract

**File:** `SimpleStorage.sol`  
**License:** MIT  
**Compiler:** ^0.8.19  

```solidity
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

    function addFavoriteNumber(uint256 _number, string memory _name) 
public {
        favoriteNumbers.push(Person(_number, _name));
        nameToFavoriteNumber[_name] = _number; 
    }
}
```

## Deployment
- **Network:** Sepolia Testnet  
- **Address:** `0x5bB6F3aa6f20A8B2C0C59222Cc774f2A913fD638`  
- **Tx Hash:** 
`0xba900ad1364be94f0b27f1d22ccc39f710e445aab0db44a7afdd187134f85f7d`  
- **Verified On Explorer:** [View on 
Etherscan](https://sepolia.etherscan.io/address/0x5bB6F3aa6f20A8B2C0C59222Cc774f2A913fD638)

## Testing
Tested in Remix:
- Set favorite number
- Retrieve favorite number
- Add person + favorite number
- Check mapping resolves correctly

*(Foundry tests will be added in later sections.)*

## Learnings
- How state variables persist across transactions
- Structs and arrays allow grouping data logically
- Mappings are efficient for key → value storage
- Public state variables automatically get getter functions
- Importance of deployment flow (deploy → set → read → verify on chain)
