# SimpleStorage - Foundry Learning Project

A simple smart contract project built with **Foundry** for learning Ethereum development and blockchain interactions.

## About Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

- **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
- **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
- **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
- **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Project Structure

```
├── src/
│   └── SimpleStorage.sol          # Main smart contract
├── script/
│   └── DeploySimpleStorage.s.sol  # Deployment script
├── foundry.toml                   # Foundry configuration
└── README.md                      # This file
```

## SimpleStorage Contract

The SimpleStorage contract includes:

- `store(uint256)` - Store a favorite number
- `retrieve()` - Get the stored favorite number
- `addPerson(string, uint256)` - Add a person with their favorite number
- `nameToFavoriteNumber` mapping - Get favorite number by name
- `listOfPeople` array - List of all people

## Documentation

https://book.getfoundry.sh/

## Commands & Usage

### 1. Build the Project

```shell
forge build
```

Compiles all Solidity contracts in the project.

### 2. Test the Project

```shell
forge test
```

Runs all tests (when test files are created).

### 3. Format Code

```shell
forge fmt
```

Formats Solidity code according to style guidelines.

### 4. Start Local Blockchain (Anvil)

```shell
anvil
```

Starts a local Ethereum node for development and testing.

### 5. Deploy Contract

```shell
# Deploy to local Anvil
forge script script/DeploySimpleStorage.s.sol --rpc-url http://localhost:8545 --private-key <anvil_private_key> --broadcast

# Deploy to testnet
forge script script/DeploySimpleStorage.s.sol --rpc-url <testnet_rpc_url> --private-key <your_private_key> --broadcast
```

## Cast Commands - Blockchain Interactions

### Read Operations (cast call) - Free, No Gas

```shell
# Read myFavoriteNumber
cast call <CONTRACT_ADDRESS> "myFavoriteNumber()" --rpc-url <RPC_URL>

# Call retrieve function
cast call <CONTRACT_ADDRESS> "retrieve()" --rpc-url <RPC_URL>

# Get favorite number by name
cast call <CONTRACT_ADDRESS> "nameToFavoriteNumber(string)" "Alice" --rpc-url <RPC_URL>

# Get person from array by index
cast call <CONTRACT_ADDRESS> "listOfPeople(uint256)" 0 --rpc-url <RPC_URL>
```

### Write Operations (cast send) - Costs Gas

```shell
# Store a favorite number
cast send <CONTRACT_ADDRESS> "store(uint256)" 42 --private-key <PRIVATE_KEY> --rpc-url <RPC_URL>

# Add a person
cast send <CONTRACT_ADDRESS> "addPerson(string,uint256)" "Alice" 25 --private-key <PRIVATE_KEY> --rpc-url <RPC_URL>
```

### Utility Commands

```shell
# Convert hex to decimal
cast --to-dec 0x2a

# Convert decimal to hex
cast --to-hex 42

# Get block information
cast block latest --rpc-url <RPC_URL>

# Get account balance
cast balance <ADDRESS> --rpc-url <RPC_URL>

# Get transaction receipt
cast receipt <TX_HASH> --rpc-url <RPC_URL>
```

## Key Differences: cast call vs cast send

| `cast call`                | `cast send`                     |
| -------------------------- | ------------------------------- |
| **Read-only** operations   | **Write** operations            |
| **No gas cost**            | **Costs gas**                   |
| **No transaction created** | **Creates a transaction**       |
| **Instant results**        | **Needs mining confirmation**   |
| **No private key needed**  | **Requires private key/wallet** |

## Development Workflow

1. **Start Anvil**: `anvil`
2. **Deploy Contract**: `forge script script/DeploySimpleStorage.s.sol --rpc-url http://localhost:8545 --private-key <key> --broadcast`
3. **Interact with Contract**: Use `cast call` for reading, `cast send` for writing
4. **Test Changes**: Verify with `cast call` commands

## Learning Notes

- **Anvil** provides 10 test accounts with 10,000 ETH each
- **Private keys** are displayed when you start Anvil
- **RPC URL** for local Anvil is `http://localhost:8545`
- Always use `--broadcast` flag when deploying with forge script
- `cast call` is perfect for testing without spending gas

## Help Commands

```shell
forge --help
anvil --help
cast --help
cast call --help
cast send --help
```
