import Web3 from 'web3';

const web3 = new Web3(new Web3.providers.HttpProvider('http://localhost:8545'));

const contractAddress = '0x1234567890abcdef';
const storageSlotIndex = 0;
const blockNumber = 'latest';

web3.eth.getStorageAt(contractAddress, storageSlotIndex, blockNumber).then((value) => {
  console.log(value);
});
