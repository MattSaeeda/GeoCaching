pragma solidity >0.4.99 <0.6.0;

interface StateStorage { 

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

contract GeoCacher  {

    address public owner;
    StateStorage public stateStorage;
    address[] bag;

    constructor(StateStorage _stateStorage) public {
        owner = msg.sender;
        stateStorage = _stateStorage;
       
    }

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

    function setTheBag() private {
        address[] memory someBag;
        stateStorage.setAddressArray("bag" , someBag );
    }
    
    function claimOwnershipOfItem(Item _item) public onlyOwner{
        // 
        stateStorage.updateAddressArray("bag" , address(_item ));
        _item.changeItemOwnership(msg.sender);
    }

    function listChacherItems() public  onlyOwner  returns ( address[] memory ){
        uint counter = 0;
        for (uint j = 0; j<stateStorage.getAddressArray("bag").length; j++) {
            counter++;
        }
        address[] memory b = new address[](counter);
        uint counter2 = 0;
        for (uint i = 0; i<stateStorage.getAddressArray("bag").length; i++) {
            b[counter2] = bag[i];
            counter2++;
        }
        return b;
    }

    function showItemInfo(Item  _item) public  returns (address, string memory, bool, bytes32){
        _item.showItemSpecs();

    }

    function placeItemInCache(Item _item) public onlyOwner returns(bool) {
        require(_item.getinCache() == false);
        _item.putItemInCache();
        return true;
    }

    function eliminateItemFromCache(Item _item) public onlyOwner returns (bool) {
        require(_item.getinCache() == true);
        _item.removeItemFromChache();
        return true;
    }

}