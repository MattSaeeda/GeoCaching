var GeoCacher = artifacts.require("GeoCacher");

module.exports = function(deployer) {
  deployer.deploy(GeoCacher);
};

var Cache = artifacts.require("Cache");

module.exports = function(deployer) {
  deployer.deploy(Cache);
};

var Storage = artifacts.require("Storage");

module.exports = function(deployer) {
  deployer.deploy(Storage);
};

