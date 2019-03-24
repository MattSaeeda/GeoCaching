pragma solidity >0.4.99 <0.6.0;

contract Cache {
      function itemOwner() public pure returns (address){}
      function name() public pure returns (string memory) {}
      function inChache() public pure returns (bool) {}
      function coordinates() public pure returns (bytes32) {}
      function putItemInCache() public;
      function removeItemFromChache() public;
      function showItemSpecs() public returns(address, string memory, bool, bytes32);
  }   

contract GeoCacher {

  address public owner;

  constructor() public {
    owner = msg.sender;
  }

  address[] bag;

  Cache newItem;
  
  function createItem(bytes memory code, uint256 salt) public returns (address){
    address addr;
    assembly {
      addr := create2(0, add(code, 0x20), mload(code), salt)
      if iszero(extcodesize(addr)) {
        revert(0, 0)
      }
    }

    return addr;
  }

  function setAllBags(address[] memory newBag) private {
    bag = newBag;
  }

  function claimOwnershipOfItem(address  _item) public{
    bag.push(_item);

  }

  function listChacherItems() public view returns ( address[] memory ){
      uint counter = 0;
      for (uint j = 0; j<bag.length; j++) {
          counter++;
      }

      address[] memory b = new address[](counter);

      uint counter2 = 0;
      for (uint i = 0; i<bag.length; i++) {
          b[counter2] = bag[i];
          counter2++;
      }
      return b;
  }

  function showItemInfo(address  _item) public  returns (address, string memory, bool, bytes32){
    newItem = Cache(_item);
    newItem.showItemSpecs();
    
  }

  function placeItemInCache(address _item) public returns(bool) {
    newItem = Cache(_item);
    require(newItem.inChache() == false);
    newItem.putItemInCache();
    return true;
  }

  function eliminateItemFromCache(address _item) public returns (bool) {
    newItem = Cache(_item);
    require(newItem.inChache() == true);
    newItem.removeItemFromChache();
    return true;
  }

}