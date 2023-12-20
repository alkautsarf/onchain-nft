// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {OnChainNft} from "../src/OnChainNft.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";


contract MintNft is Script {    
    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("OnChainNft", block.chainid);
        mintNftOnContract(mostRecentlyDeployed);
    }
    
    function mintNftOnContract(address _contractAddress) public {
        vm.startBroadcast();
        OnChainNft(_contractAddress).mint();
        vm.stopBroadcast();
    }
}
