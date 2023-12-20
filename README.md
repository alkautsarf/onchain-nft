# OnChain NFT

This project implements an on-chain non-fungible token (NFT) contract using Solidity and Foundry. The contract extends the ERC721 standard from the OpenZeppelin library.

## Usage

### src/

The main contract file is located at `src/OnChainNft.sol`. This contract defines the functionality for creating and managing NFTs. It extends the ERC721 contract from the OpenZeppelin library.

#### Contract Details

- `OnChainNft`: This is the main contract that inherits from ERC721. It implements the logic for creating and managing NFTs.

#### Constants

- `MAX_TOTAL_SUPPLY`: This constant defines the maximum total supply of NFTs that can be created.

#### Variables

- `s_catSvg`: This is a storage variable that stores the SVG data for the NFT.
- `s_tokenCounter`: This is a storage variable that track the recent amount of NFT being minted.

#### Constructor

- `constructor`: The constructor function initializes the contract and sets the name and symbol for the NFT. It also assigns the value of `s_catSvg` using the provided SVG data.

### script/

#### Deploy

The contract located in `script/DeployOnChainNft.s.sol` is used for deploying contract. The command to deploy it to `Sepolia Testnet` is as follows.

    forge script script/DeployOnChainNft.s.sol:DeployOnChainNft --rpc-url $SEPOLIA_RPC_URL --account defaultKey --sender $MAIN_ADDRESS --verify --etherscan-api-key $ETHERSCAN_API_KEY --broadcast

#### Mint an NFT

The contract located in `script/Interactions.s.sol` is used to mint an NFT from recently deployed contract. The command to mint it in `Sepolia Testnet` is as follows.

    forge script script/Interactions.s.sol:MintNft --rpc-url $SEPOLIA_RPC_URL --account defaultKey --sender $MAIN_ADDRESS --broadcast

## Testing

Run command as follows to run `Integration Testing` with the deployment script.

    forge test

## Contributing

Contributions to this project are welcome. If you find any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License.