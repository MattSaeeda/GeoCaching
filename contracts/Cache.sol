pragma solidity >0.4.99 <0.6.0;

import "../contracts/Storage.sol";

contract Chache is Storage {

      //address public owner;
      string public name;
      address public itemOwner;
      bool public inCache;
      bytes32  public coordinates;

      // constructor() public {
      //       owner = msg.sender;
      // }
      
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
      


}