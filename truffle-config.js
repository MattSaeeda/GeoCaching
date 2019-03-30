
//   var HDWalletProvider = require("truffle-hdwallet-provider");
//   var mnemonic = "mask combine effort cupboard royal together motor connect warm sweet alter inside";
//   module.exports = {
  
//   networks: {
//     rinkeby: {
//       provider: function() {
//         return new HDWalletProvider(mnemonic, "https://rinkeby.infura.io/v3/0a002775c6e34fe397916ae7430fed41");
//       },
//       network_id: 4,
//     },

//   //   test: {
//   //     provider: function() {
//   //       return new HDWalletProvider(mnemonic, "http://127.0.0.1:7545/");
//   //     },
//   //     network_id: '*',
//   //   },
//    },
  
//  // Configure your compilers

//   compilers: {
//     solc: {
//       version: "0.5.6",    // Fetch exact version from solc-bin (default: truffle's version)
//       docker: false,        // Use "0.5.1" you've installed locally with docker (default: false)
//       settings: {          // See the solidity docs for advice about optimization and evmVersion
//        optimizer: {
//          enabled: false,
//          runs: 200
//        },
//        evmVersion: "constantinople"
//       }
//     }
//   }
// };
module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!

  networks: {

    // networks: {
    //   ganache: {
    //   host: "127.0.0.1",
    //   port: 7545,
    //   network_id: "*"
    //   },

    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*" // Match any network id
    }
  }
}
