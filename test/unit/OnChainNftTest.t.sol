// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {OnChainNft} from "../../src/OnChainNft.sol";
import {DeployOnChainNft} from "../../script/DeployOnChainNft.s.sol";

contract OnChainNftTest is Test {
    DeployOnChainNft public deployer;
    OnChainNft public onChainNft;

    address public USER = makeAddr("user");

    function setUp() public {
        deployer = new DeployOnChainNft();
        onChainNft = deployer.run();
    }

    function testNftNameIsValid() public {
        assertEq(keccak256(bytes(onChainNft.name())),keccak256(bytes("Nyan Cat")));
    }

    function testNftSymbolIsValid() public {
        assertEq(keccak256(bytes(onChainNft.symbol())),keccak256(bytes("NYC")));
    }

    function testMintSucceed() public {
        vm.prank(USER);
        onChainNft.mint();
        assertEq(onChainNft.balanceOf(USER), 1);
        assertEq(onChainNft.ownerOf(0), USER);
    }

    function testMintFailedExceededSupply() public {
        vm.startPrank(USER);
        onChainNft.mint();
        vm.expectRevert(OnChainNft.OnChainNft__ExceededSupply.selector);
        onChainNft.mint();
        vm.stopPrank();
    }

}
