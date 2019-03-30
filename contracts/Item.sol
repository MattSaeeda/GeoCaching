pragma solidity >0.4.99 <0.6.0;

//import "../contracts/Storage.sol";
interface StateStorage { 
    // function storeBytes(bytes32 key, bytes calldata value) external;
    // function getBytes(bytes32 key) external returns(bytes memory);

    function getAddress(bytes32 key) external returns (address);
    function getAddressArray(bytes32 key) external returns (address[] memory);
    function getUint(bytes32 key) external returns (uint);
    function getBool(bytes32 key) external returns (bool);
    function getBytes32(bytes32 key) external returns (bytes32);
    function getString(bytes32 key) external returns (string memory);
    function setAddressArray(bytes32 key, address[] calldata value) external;
    function updateAddressArray(bytes32 key, address  value) external;
    function setAddress(bytes32 key, address value) external;
    function setUint(bytes32 key, uint value) external;
    function setBool(bytes32 key, bool value) external;
    function setBytes32(bytes32 key, bytes32 value) external;
    function setString(bytes32 key, string calldata value) external;
}

contract Item {

      StateStorage public _stateStorage;
      string public name;
      address public itemOwner;
      bool public inCache;
      bytes32  public coordinates;

      constructor(StateStorage stateStorage) public {
        _stateStorage = stateStorage;
      }
      
      function putItemInCache() public {
            
            _stateStorage.setBool("inCache" , true);

      }

      function removeItemFromChache() public {
            
            _stateStorage.setBool("inCache" , false);

      }

      function showItemSpecs() public  returns(address,string memory, bool, bytes32) {
           
           _stateStorage.getAddress("itemOwner");
           _stateStorage.getString("name");
           _stateStorage.getBool("inCache");
           _stateStorage.getBytes32("coordinates");
      }

      function changeItemOwnership(address _newOwner) public {
            
            _stateStorage.setAddress("itemOwner" , _newOwner);
      }
      
      function setName(string memory _name) public {
            _stateStorage.setString("name" , _name);
      }

      function setinCache(bool  _inCache) public {
            _stateStorage.setBool("inCache" , _inCache);
      }

      function setCoordinates(bytes32 _coordinates) public {
            _stateStorage.setBytes32("coordinates" , _coordinates);
      }

      function getOwnership() public returns(address) {
            return _stateStorage.getAddress("itemOwner");
      }

      function getName() public returns(string memory) {
            return _stateStorage.getString("name");
      }

      function getinCache() public  returns(bool) {
            return _stateStorage.getBool("inCache");
      }

      function getCoordinates() public returns(bytes32) {
            return _stateStorage.getBytes32("coordinates");
      }

}