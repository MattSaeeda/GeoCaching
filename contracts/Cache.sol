pragma solidity >0.4.99 <0.6.0;

import "../contracts/Storage.sol";

contract Chache is Storage {

      //address public owner;
      string public name;
      address public itemOwner;
      bool public inCache;
      bytes32  public coordinates;
      
      function putItemInCache() public {
            //inCache = true;
            Storage.setBool("inCache" , true);

      }

      function removeItemFromChache() public {
            //inCache = false;
            Storage.setBool("inCache" , false);

      }

      function showItemSpecs() public view returns(address,string memory, bool, bytes32) {
           //return(address(itemOwner), string(name), bool(inCache), bytes32 (coordinates));
           Storage.getAddress("itemOwner");
           Storage.getString("name");
           Storage.getBool("inCache");
           Storage.getBytes32("coordinates");
      }

      function changeItemOwnership(address _newOwner) public {
            //itemOwner = _newOwner;
            Storage.setAddress("itemOwner" , _newOwner);
      }
      
      function setName(string memory _name) public {
            Storage.setString("name" , _name);
      }

      function setinCache(bool  _inCache) public {
            Storage.setBool("inCache" , _inCache);
      }

      function setCoordinates(bytes32 _coordinates) public {
            Storage.setBytes32("coordinates" , _coordinates);
      }

      function getOwnership() public view returns(address) {
            return Storage.getAddress("itemOwner");
      }

      function getName() public view returns(string memory) {
            return Storage.getString("name");
      }

      function getinCache() public view returns(bool) {
            return Storage.getBool("inCache");
      }

      function getCoordinates() public view returns(bytes32) {
            return Storage.getBytes32("coordinates");
      }

}