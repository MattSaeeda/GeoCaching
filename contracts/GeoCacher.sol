
pragma solidity >0.4.99 <0.6.0;
//import "../contracts/Cache.sol";
import "../contracts/Storage.sol";

contract Cache {
      // function itemOwner() public pure returns (address){}
      function name() public pure returns (string memory) {}
      function itemOwner() public pure returns(address){}
      function inCache() public pure returns (bool) {}
      function coordinates() public pure returns (bytes32) {}
      function getinCache() public pure returns (bool){}
      function putItemInCache() public;
      function setName() public;
      function setinCache() public;
      function setCoordinates() public;
      function getOwnership() public view returns(address);
      function getName() public view returns(string memory);
      function getCoordinates() public view returns(bytes32);
      function removeItemFromChache() public;
      function showItemSpecs() public returns(address, string memory, bool, bytes32);
      function changeItemOwnership(address) public;
  }   

contract GeoCacher is Storage {

  address public owner;

  constructor() public {
    owner = msg.sender;
  }

  address[] bag;
  
  Cache newItem;

  modifier onlyOwner() {
	  require(msg.sender == owner);
		_;
	}
  
  function createItem(bytes memory code, uint256 salt) public  returns (address){
    address addr;
    assembly {
      addr := create2(0, add(code, 0x20), mload(code), salt)
      if iszero(extcodesize(addr)) {
        revert(0, 0)
      }
    }

    return addr;
  }

  // function setTheBag() private {
  //   address[] memory someBag;
  //   Storage.setAddressArray("bag" , someBag );
  // }

  function claimOwnershipOfItem(address  _item) public onlyOwner {
    Storage.updateAddressArray("bag" , _item );//???
    newItem = Cache(_item);
    newItem.changeItemOwnership(_item);
  }

  function listChacherItems() public  onlyOwner view returns ( address[] memory ){
      uint counter = 0;
      for (uint j = 0; j<getAddressArray("bag").length; j++) {
          counter++;
      }

      address[] memory b = new address[](counter);

      uint counter2 = 0;
      for (uint i = 0; i<getAddressArray("bag").length; i++) {
          b[counter2] = bag[i];
          counter2++;
      }
      return b;
  }

  function showItemInfo(address  _item) public  returns (address, string memory, bool, bytes32){
    newItem = Cache(_item);
    newItem.showItemSpecs();
    
  }

  function placeItemInCache(address _item) public onlyOwner returns(bool) {
    newItem = Cache(_item);
    //require(newItem.getinCache("inCache") == false);
    newItem.putItemInCache();
    return true;
  }

  function eliminateItemFromCache(address _item) public onlyOwner returns (bool) {
    newItem = Cache(_item);
    require(newItem.getinCache() == true);
    newItem.removeItemFromChache();
    return true;
  }

}