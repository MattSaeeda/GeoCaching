pragma solidity >0.4.99 <0.6.0;

contract Storage {

  mapping(address => mapping(bytes32 => uint256)) _uintStorage;
  mapping(address => mapping(bytes32 => address)) _addressStorage;
  mapping(address => mapping(bytes32 => bool)) _boolStorage;
  mapping(address => mapping(bytes32 => bytes32)) _bytes32Storage;
  mapping(address => mapping(bytes32 => string)) _stringStorage;

  // Get Functions

  function getAddress(bytes32 key) public view returns (address) {
      return _addressStorage[msg.sender][key];
  }

  function getUint(bytes32 key) public view returns (uint) {
      return _uintStorage[msg.sender][key];
  }

  function getBool(bytes32 key) public view returns (bool) {
      return _boolStorage[msg.sender][key];
  }

  function getBytes32(bytes32 key) public view returns (bytes32 ) {
      return _bytes32Storage[msg.sender][key];
  }

  function getString(bytes32 key) public view returns (string memory) {
      return _stringStorage[msg.sender][key];
  }

  //Set Functions

  function setAddress(bytes32 key, address value) public {
    _addressStorage[msg.sender][key] = value;
  }

  function setUint(bytes32 key, uint value) public {
      _uintStorage[msg.sender][key] = value;
  }

  function setBool(bytes32 key, bool value) public {
      _boolStorage[msg.sender][key] = value;
  }

  function setBytes32(bytes32 key, bytes32 value) public {
      _bytes32Storage[msg.sender][key] = value;
  }

  function setString(bytes32 key, string memory value) public {
      _stringStorage[msg.sender][key] = value;
  }

}

