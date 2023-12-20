// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {OnChainNft} from "../src/OnChainNft.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployOnChainNft is Script {
    function run() public returns (OnChainNft) {
        string memory catSvg = vm.readFile("./img/nyan-cat.svg");
        vm.startBroadcast();
        OnChainNft onChainNft = new OnChainNft(svgToImageURI(catSvg));
        vm.stopBroadcast();
        return onChainNft;
    }

    function svgToImageURI(
        string memory svg
    ) public pure returns (string memory) {
        string memory baseURL = "data:image/svg+xml;base64,";
        string memory svgBase64Encoded = Base64.encode(
            bytes(string(abi.encodePacked(svg)))
        );
        return string(abi.encodePacked(baseURL, svgBase64Encoded));
    }
}
