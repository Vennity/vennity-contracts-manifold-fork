// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/// @author: vennity

import "@openzeppelin/contracts/utils/introspection/IERC165.sol";

interface IContractMetadataURIUpgradeable is IERC165 {

    function contractURI() external view returns (string memory);

    function setContractURI(string memory _cURI) external;
}
