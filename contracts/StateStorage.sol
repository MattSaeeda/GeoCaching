pragma solidity >0.4.99 <0.6.0;

contract StateStorage {

  mapping(address => mapping(bytes32 => uint256)) _uintStorage;
  mapping(address => mapping(bytes32 => address)) _addressStorage;
  mapping(address => mapping(bytes32 => address[])) _addressArrayStorage;
  mapping(address => mapping(bytes32 => bool)) _boolStorage;
  mapping(address => mapping(bytes32 => bytes32)) _bytes32Storage;
  mapping(address => mapping(bytes32 => string)) _stringStorage;

  address public caller;

  function setCaller(address _caller) public {
        caller = _caller;
  }

  modifier onlyCaller() {
        require(msg.sender == caller);
        _;
    }

  // Get Functions

  function getAddress(bytes32 key) external view onlyCaller returns (address) {
      return _addressStorage[msg.sender][key];
  }

  function getAddressArray(bytes32 key) external view onlyCaller returns (address[] memory) {
      return _addressArrayStorage[msg.sender][key];
  }

  function getUint(bytes32 key) external view onlyCaller returns (uint) {
      return _uintStorage[msg.sender][key];
  }

  function getBool(bytes32 key) external view onlyCaller returns (bool) {
      return _boolStorage[msg.sender][key];
  }

  function getBytes32(bytes32 key) external view onlyCaller returns (bytes32 ) {
      return _bytes32Storage[msg.sender][key];
  }

  function getString(bytes32 key) external view onlyCaller returns (string memory) {
      return _stringStorage[msg.sender][key];
  }

  //Set Functions

  function setAddressArray(bytes32 key, address[] calldata value) external onlyCaller {
    _addressArrayStorage[msg.sender][key] = value;
  }

  function updateAddressArray(bytes32 key, address  value) external onlyCaller {
    _addressArrayStorage[msg.sender][key].push(value);
  }

   function setAddress(bytes32 key, address value) external onlyCaller {
    _addressStorage[msg.sender][key] = value;
  }


  function setUint(bytes32 key, uint value) external onlyCaller {
      _uintStorage[msg.sender][key] = value;
  }

  function setBool(bytes32 key, bool value) external onlyCaller {
      _boolStorage[msg.sender][key] = value;
  }

  function setBytes32(bytes32 key, bytes32 value) external onlyCaller {
      _bytes32Storage[msg.sender][key] = value;
  }

  function setString(bytes32 key, string calldata value) external onlyCaller {
      _stringStorage[msg.sender][key] = value;
  }

}

