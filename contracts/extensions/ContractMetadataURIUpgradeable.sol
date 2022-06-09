// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @author: vennity

import "@openzeppelin/contracts/utils/introspection/ERC165.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol";

import "@manifoldxyz/libraries-solidity/contracts/access/AdminControl.sol";
import "./IContractMetadataURIUpgradeable.sol";

abstract contract ContractMetadataURIUpgradeable is Initializable, ContextUpgradeable, IContractMetadataURIUpgradeable, ERC165 {
    string private cURI;

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    function __ContractMetadataURIUpgradeable_init(string memory _cURI) internal initializer {
        __ContractMetadataURIUpgradeable_init_unchained(_cURI);
    }

    function __ContractMetadataURIUpgradeable_init_unchained(string memory _cURI) internal initializer {
        setContractURI(_cURI);
    }
    /**
    * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC165, IERC165) returns (bool) {
        return interfaceId == type(IContractMetadataURIUpgradeable).interfaceId || super.supportsInterface(interfaceId);
    }
    /**
     * @dev gets collection details for opensea
         */
    function contractURI() public override view returns(string memory) {
        return cURI;
    }

    /**
     * @dev sets the contract URI
    */
    function setContractURI(string memory _cURI) public override virtual {
        _setContractURI(_cURI);
    }

    function _setContractURI(string memory _cURI) internal virtual {
        cURI = _cURI;
    }
}
