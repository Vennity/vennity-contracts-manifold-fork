
pragma solidity ^0.8.0;

/// @author: vennity

import "@openzeppelin/contracts/utils/introspection/ERC165.sol";


interface IContractMetadataURIUpgradeable is ERC165 {

    function contractURI() external view returns (string memory);

    function setContractURI(string memory _cURI) external;
}
