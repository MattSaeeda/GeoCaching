var GeoCacher = artifacts.require("GeoCacher");

module.exports = function(deployer) {
  deployer.deploy(GeoCacher);
};

var Item = artifacts.require("Item");

module.exports = function(deployer) {
  deployer.deploy(Item);
};

var StateStorage = artifacts.require("StateStorage");

module.exports = function(deployer) {
  deployer.deploy(StateStorage);
};

