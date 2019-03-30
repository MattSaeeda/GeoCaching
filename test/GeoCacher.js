const GeoCacher = artifacts.require("GeoCacher");
const Cache = artifacts.require("Cache");
const Storage = artifacts.require("Storage");
const {shouldFail } = require('openzeppelin-test-helpers');
var assert = require('chai').assert;
var should = require('chai').should;
const mode = process.env.MODE;

let geoCacherInstance;


contract("GeoCacher", accounts => {
  
  beforeEach(async function() {
    geoCacherInstance = await GeoCacher.new();
    //console.log(geoCacherInstance.byteCode);
    this.timeout(5000);
  });  

  after("write coverage/profiler output", async () => {
    if (mode === "profile") {
      await global.profilerSubprovider.writeProfilerOutputAsync();
    } 
    else
      if (mode === "coverage") {
      await global.coverageSubprovider.writeCoverageAsync();
    }

  });

 
  describe('Ownership Modifier Tests' , function(){
  

    it("Should have owner address be same address who deployed contract", async () => {
      const owner = accounts[0];
      assert.equal(
       (await geoCacherInstance.owner()),
        owner
      );
    });
 
    it("Should fail if a non-owner calls placeItemInCache with the onlyOwner modifier", async function() {
      const currentOwner = accounts[0];
      const anotherAccount = accounts[2];
      const itemAddress = "0x096e3a68D2aE3F66cE0Fb0C9fc3aB7272806c4F1";
      
      assert.equal(
        (await geoCacherInstance.owner()),
        currentOwner,
        "Initial owner is not address expected."
      );

      await shouldFail.reverting(geoCacherInstance.placeItemInCache(itemAddress, 
        { from: anotherAccount }) );
    });

    it("Should fail if a non-owner calls eliminateItemFromCache with the onlyOwner modifier", async function() {
      const currentOwner = accounts[0];
      const anotherAccount = accounts[2];
      const itemAddress = "0x096e3a68D2aE3F66cE0Fb0C9fc3aB7272806c4F1";
      assert.equal(
        (await geoCacherInstance.owner()),
        currentOwner,
        "Initial owner is not address expected."
      );

      await shouldFail.reverting(geoCacherInstance.eliminateItemFromCache(itemAddress, 
        { from: anotherAccount }));
    });


    it("Should fail if a non-owner calls listChacherItems with the onlyOwner modifier", async function() {
      const currentOwner = accounts[0];
      const anotherAccount = accounts[2];
      assert.equal(
        (await geoCacherInstance.owner()),
        currentOwner,
        "Initial owner is not address expected."
      );

      await shouldFail.reverting(geoCacherInstance.listChacherItems({ from: anotherAccount }));
    });

    // it("Should allow owner to change status", async function() {
    //    const currentOwner = accounts[0];
    //    const anotherAccount = accounts[1];
    //    const booleanValue = true;

    //    assert.equal(
    //     (await supplierAssignInstance.owner()),
    //    currentOwner,
    //     "Initial owner is not address expected."
    //   );

    //   await supplierAssignInstance.assign(anotherAccount, true);

    //   assert.equal(
    //   (await supplierAssignInstance.supplierStatus.call(anotherAccount)),
    //   booleanValue,
    //   "Updated supplier's status is not `true'"
    // );

    // });
  });

  
describe('Functions Tests' , function(){

  // it("should be able to create an item", async function() {
  //   const owner = accounts[0];
  //   //contract("Cache", accounts => {cacheInstance =  Cache.new();});
  //   cacheInstance = Cache.new();
  //   const bytecode = cacheInstance.byteCode;
  //   const salt = 3;
  //   assert.typeOf(
  //     (await geoCacherInstance.createItem(bytecode , salt)) , 'string');



    // const computedAddr = buildCreate2Address(
    //   geoCacherInstance.address,
    //   numberToUint256(salt),
    //   bytecode
    // )

  // });
  //it("should fail wrong bytecode given to create item", async function() {});
 // it("should fail if wrong type of salt given to create item", async function() {});
  it("should be able to claim an item ownership", async function() {
    const owner = accounts[0];
    console.log(owner);
    cacheInstance = await Cache.new();
    storageInstance = await Storage.new();
    console.log(cacheInstance.address);
    console.log(Storage.address);
    await geoCacherInstance.claimOwnershipOfItem(cacheInstance.address);
    await cacheInstance.getOwnership()
    console.log(cacheInstance.getOwnership())
    assert.equal(
      (await cacheInstance.getOwnership(),
      owner
    ));


  });
  it("should fail when wrong item type given to claimOwnershipOfItem", async function() {
    const owner = accounts[0];
    const itemAddress = 123;
    await should.Throw(geoCacherInstance.claimOwnershipOfItem(itemAddress));
  });
  it("should be able to list Cacher's items", async function() {});
  it("should be able to show an item's specs", async function() {});
  it("should fail if wrong address passed to show item specs", async function() {});
  it("should return true after putting  an item in Cache", async function() {});
  it("should fail if wrong item passed to put in cache", async function() {});
  it("should fail if an item is already in cache", async function() {});
  it("should fail if wrong item passed to be removed from cache", async function() {});
  it("should return true afer removing an item from cache", async function() {});
  it("should fail if item is nor in cache", async function() {});

});
  
    
  

});

//Helper functions from : https://github.com/miguelmota/solidity-create2-example.git by : Miguel Mota

function buildCreate2Address(creatorAddress, saltHex, byteCode) {
  return `0x${web3.utils.sha3(`0x${[
    'ff',
    creatorAddress,
    saltHex,
    web3.utils.sha3(byteCode)
  ].map(x => x.replace(/0x/, ''))
  .join('')}`).slice(-40)}`.toLowerCase()
}

// converts an int to uint256
function numberToUint256(value) {
  const hex = value.toString(16)
  return `0x${'0'.repeat(64-hex.length)}${hex}`
}

// encodes parameter to pass as contract argument
function encodeParam(dataType, data) {
  return web3.eth.abi.encodeParameter(dataType, data)
}

// returns true if contract is deployed on-chain
async function isContract(address) {
  const code = await web3.eth.getCode(address)
  return code.slice(2).length > 0
}