pragma solidity >0.4.99 <0.6.0;

contract Chache {

      //address public owner;
      string public name;
      address public itemOwner;
      bool public inCache;
      bytes32  public coordinates;

      // constructor() public {
      //       owner = msg.sender;
      // }
      
      function putItemInCache() public {
            inCache = true;

      }

      function removeItemFromChache() public {
            inCache = false;

      }

      function showItemSpecs() public view returns(address,string memory, bool, bytes32) {
           return(address(itemOwner), string(name), bool(inCache), bytes32 (coordinates));

      }

      


}