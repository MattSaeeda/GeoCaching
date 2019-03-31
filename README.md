# Geocaching*
This repo is foundation of a geocaching dApp. It consist of 3 smart contracts: GeoCacher.sol, Item.sol and StateStorage.sol written in Solidity. Each item has an Etherium address pointing at a contract: Item.sol. This contract holds the specs(states) of that item.
GeoCacher.sol belongs to the owner or message sender. From this contract, itemss' addresses can be created or their state can be managed. Both these contracts store their states in the third contract: StateStorage.sol. Upgrading strategy is Caller-Calle.

TODO: Due to numerouse errors, testing has not been done.

*Create2 function and helper functions codes are  from: Miguel Mota  https://github.com/miguelmota/solidity-create2-example.git
