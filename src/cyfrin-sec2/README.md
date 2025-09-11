# Cyfrin Solidity Fundamentals — Section 2: Storage Factory

This section builds on **SimpleStorage** (Section 1) and introduces 
deploying and interacting with contracts from other contracts.  
The focus is on **composability** — one of the core ideas in Solidity and 
DeFi.

---

## Concepts Learned

- **Deploying contracts from a contract** using the `new` keyword.
- **Tracking contract addresses** in arrays for later use.
- **Importing contracts** across multiple files with `import`.
- **Inheritance**: extending and reusing logic across contracts.
- **Overriding functions** (e.g., `AddFiveStorage` overrides `store()` 
from `SimpleStorage`).
- **ABI (Application Binary Interface)** basics: how contracts interact by 
address + ABI.

---

## Contracts in This Section

### 1. `SimpleStorage.sol`
- Stores a single number (`favoriteNumber`).
- Provides functions:
  - `store(uint256)`: update the number.
  - `retrieve()`: view the number.

---

### 2. `AddFiveStorage.sol`
- Inherits from `SimpleStorage`.
- Overrides the `store()` function to **always add +5** to the input.

---

### 3. `StorageFactory.sol`
- Deploys new instances of `SimpleStorage` contracts.
- Tracks deployed contracts in an array:

```solidity
SimpleStorage[] public simpleStorageContractList;
```

**Provides functions:**
- `createSimpleStorageContract()`: deploys and saves a new 
`SimpleStorage`.
- `sfStore(uint256 index, uint256 value)`: calls `store()` on one of the 
deployed contracts.
- `sfRetrieve(uint256 index)`: reads the stored value from a deployed 
contract.
