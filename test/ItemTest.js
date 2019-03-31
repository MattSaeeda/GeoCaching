const Item = artifacts.require("Item");
const StateStorage = artifacts.require("StateStorage");

const {shouldFail } = require('openzeppelin-test-helpers');
var assert = require('chai').assert;
var should = require('chai').should;
const mode = process.env.MODE;

let itemInstance;
let stateStorageInstance;

contract("Item", accounts => {
  
    
    
     
      describe('Function Tests' , function(){
            it("Should be able to put an item in Cache", async function(){
                  itemInstance = await Item.deployed();
                  stateStorageInstance = await StateStorage.deployed();
                  await itemInstance.putItemInCache();
                  assert.equal(
                            (await itemInstance.getinCache()) , true);

            } );
      
    
      });
    
});