// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";


contract OnChainNft is ERC721 {
    error OnChainNft__ExceededSupply();

    uint256 private constant MAX_TOTAL_SUPPLY = 1;
    string private s_catSvg;
    uint256 private s_tokenCounter;

    constructor(string memory _catSvg) ERC721("Nyan Cat", "NYC") {
        s_tokenCounter = 0;
        s_catSvg = _catSvg;
    }

    function mint() external {
        if(s_tokenCounter >= MAX_TOTAL_SUPPLY) {
            revert OnChainNft__ExceededSupply();
        }
        s_tokenCounter++;
        _safeMint(msg.sender, s_tokenCounter - 1);
    }

    function tokenURI(
        uint256 /** tokenId */
    ) public view override returns (string memory) {
        return string(
            abi.encodePacked(
                _baseURI(),
                Base64.encode(
                    bytes(
                        abi.encodePacked(
                            '{"name": "',
                            name(),
                            '", "description": "An NFT of a Nyan Cat.", "attributes": [{"trait_type": "nyan", "value": 100}, {"trait_type": "rainbow", "value": 100}, {"trait_type": "sprinkle on top", "value": 100}], "image": "',
                            s_catSvg,
                            '"}'
                        )
                    )
                )
            )
        );
    }

    function _baseURI() internal pure override returns (string memory) {
        return "data:application/json;base64,";
    }
}
