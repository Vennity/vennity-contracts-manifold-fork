// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @author: manifold.xyz

import "@openzeppelin/contracts/utils/introspection/ERC165Checker.sol";

import "../IERC721Creator.sol";
import "./IERC721CreatorExtensionBurnable.sol";
import "./ERC721CreatorExtensionBase.sol";

abstract contract ERC721CreatorExtensionBurnable is ERC721CreatorExtensionBase, IERC721CreatorExtensionBurnable {

    mapping (uint256 => address) private _tokenCreators;

    /**
     * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC721CreatorExtensionBase, IERC165) returns (bool) {
        return interfaceId == type(IERC721CreatorExtensionBurnable).interfaceId
            || super.supportsInterface(interfaceId);
    }

    /**
     * @dev See {IERC721CreatorExtensionBurnable-mint}.
     */
    function mint(address creator, address to) external override adminRequired returns (uint256) {
        return _mint(creator, to);
    }

    function _mint(address creator, address to) internal returns (uint256) {
        require(ERC165Checker.supportsInterface(creator, type(IERC721Creator).interfaceId), "ERC721CreatorExtensionBurnable: Requires ERC721Creator");
        uint256 tokenId = IERC721Creator(creator).mintExtension(to);
        _tokenCreators[tokenId] = creator;
        return tokenId;
    }

    /**
     * @dev See {IERC721CreatorExtension-onBurn}.
     */
    function onBurn(address, uint256 tokenId) public virtual override {
        require(_tokenCreators[tokenId] == msg.sender, "ERC721CreatorExtensionBurnable: Can only be called by token creator");
    }


}