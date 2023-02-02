import "https://raw.githubusercontent.com/MyContract/abi/main.json" for MyContract;

pragma solidity ^0.6.0;

contract ReadStorage {
  MyContract contract;

  event privateValue(string value);

  constructor(address _contractAddress) public {
    contract = MyContract(_contractAddress);
  }

  function readStorageSlot(string memory _slotName) public view returns (string memory) {
    bytes memory encodedName = abi.encodePacked(_slotName);
    bytes32 hash = keccak256(encodedName);
    bytes32 value = contract.slots(hash);
    string memory valueString = abi.decode(value, (string));
    emit privateValue(valueString);
    return valueString;
  }
}
