pragma solidity >0.4.99 <0.6.0;

import "../contracts/Storage.sol";

contract Cache is Storage {

      string public name;
      address public itemOwner;
      bool public inCache;
      bytes32  public coordinates;
      
      function putItemInCache() public {
            
            Storage.setBool("inCache" , true);

      }

      function removeItemFromChache() public {
            
            Storage.setBool("inCache" , false);

      }

      function showItemSpecs() public view returns(address,string memory, bool, bytes32) {
           
           Storage.getAddress("itemOwner");
           Storage.getString("name");
           Storage.getBool("inCache");
           Storage.getBytes32("coordinates");
      }

      function changeItemOwnership(address _newOwner) public {
            
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