// SPDX-License-Identifier: MIT

pragma solidity 0.8.30;

import "forge-std/Script.sol";

import {SimpleStorage} from "../src/SimpleStorage.sol";

contract DeploySimpleStorage is Script {
    // This script deploys the SimpleStorage contract
    // It can be run with `forge script script/DeploySimpleStorage.s.sol`
    function run() external returns (SimpleStorage) {
        // Start broadcasting transactions
        // This is necessary to deploy the contract to the blockchain
        vm.startBroadcast();
        // Deploy the SimpleStorage contract
        // The contract will be deployed to the network specified in the foundry.toml file
        SimpleStorage simpleStorage = new SimpleStorage();

        vm.stopBroadcast();
        return simpleStorage;
    }
}
