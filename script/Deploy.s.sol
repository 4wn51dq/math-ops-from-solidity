// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";

// Import your contracts
import "../src/Basics.sol";
import "../src/getPrimesBelow.sol";
import "../src/ModularInverse.sol";
import "../src/TaylorSeries.sol";
import "../src/SquareRoot.sol";

contract Deploy is Script {
    function run() external {
        // Start broadcasting to simulate sending transactions
        vm.startBroadcast();

        // Deploy contracts
        TaylorSeries taylorSeries = new TaylorSeries();
        SquareRoot squareRoot = new SquareRoot();
        ModularInverse modularInverse = new ModularInverse();
        GetPrimes gp = new GetPrimes();
        _GetPrimes gpb = new _GetPrimes();
        Basics basics = new Basics();

        vm.stopBroadcast();
    }
}