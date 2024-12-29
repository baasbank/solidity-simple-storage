# Simple Storage Contract

A basic Ethereum smart contract demonstrating state management and access control.

## Project Overview

### Features
- Store and retrieve a number
- Owner-only access control
- Event emission on updates
- Comprehensive test coverage

### Contract Interface
```solidity
interface ISimpleStorage {
    function getNumber() external view returns (uint256);
    function setNumber(uint256 newNumber) external;
    event NumberUpdated(uint256 oldNumber, uint256 newNumber);
}
```

### Development Tools
- Foundry (for testing and deployment)
- Solidity ^0.8.0
- MetaMask (for testing)

## Local Development

### Prerequisites
- [Foundry](https://book.getfoundry.sh/getting-started/installation)
- [Git](https://git-scm.com/downloads)

### Setup
1. Clone the repository
```bash
git clone git@github.com:baasbank/solidity-simple-storage.git
cd simple-storage-contract
```

2. Install dependencies
```bash
forge install
```

### Testing
Run all tests:
```bash
forge test
```

Run a specific test with verbosity:
```bash
forge test --match-test test_SetNumber -vv
```

### Local Deployment
1. Start local node in one terminal:
```bash
anvil
```

2. Deploy contract in another terminal:
```bash
forge script script/Deploy.s.sol:DeploySimpleStorage --rpc-url http://localhost:8545 --private-key $PRIVATE_KEY --broadcast
```

3. Interact with contract:
```bash
forge script script/Interact.s.sol:InteractSimpleStorage --rpc-url http://localhost:8545 --private-key $PRIVATE_KEY --broadcast
```
WHERE $PRIVATE_KEY is the private key of the account you want to use to interact with the contract gotten from one of the accounts in the terminal where you started the local node with `anvil`.
### Using with MetaMask
1. Add local network to MetaMask:
   - Network Name: Anvil Local
   - RPC URL: http://127.0.0.1:8545
   - Chain ID: 31337
   - Currency Symbol: ETH

2. Import an Anvil private key to MetaMask to interact with the contract

## Project Tasks

### 1. Store a single number
- [x] Create a new Solidity file `SimpleStorage.sol`
- [x] Define contract structure with SPDX license and pragma
- [x] Declare a state variable to store the number (uint256)
- [x] Create a constructor to set initial value

### 2. Retrieve the stored number
- [x] Create a public view function `getNumber()`
- [x] Return the stored number
- [x] Ensure function doesn't modify state (view keyword)

### 3. Update the stored number
- [x] Create a public function `setNumber(uint256 newNumber)`
- [x] Add logic to update the stored value
- [x] Emit an event for tracking updates

### 4. Add basic access control
- [x] Declare an address variable for owner
- [x] Set owner in constructor (msg.sender)
- [x] Create modifier for owner-only access
- [x] Apply modifier to setNumber function
- [x] Add function to transfer ownership (optional)

### 5. Write basic tests
- [x] Set up Foundry testing environment
- [x] Write test for deployment
- [x] Test getNumber functionality
- [x] Test setNumber with owner account
- [x] Test setNumber with non-owner account (should fail)
- [x] Test ownership functions
- [x] Test event emissions
- [x] Add fuzz testing

### 6. Deploy to local testnet
- [x] Set up deployment environment (Foundry)
- [x] Create deployment script
- [x] Set up local network configuration
- [x] Test deployment on local network
- [x] Verify contract works as expected
