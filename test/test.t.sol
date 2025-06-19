// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.t.sol";
import "../src/Basics.sol";
import "../src/GetPrimesBelow.sol";
import "../src/ModularInverse.sol";
import "../src/SquareRoot.sol";
import "../src/TaylorSeries.sol";

// Basics.sol tests
contract BasicsTest is Test {
    Basics public basics;

    function setUp() public {
        basics = new Basics();
    }

    function testSummation() public view {
        uint sum = basics.summation(5);
        assertEq(sum, 15);
    }

    function testFactorialIterative() public view {
        uint f = basics.factorialOfIterative(5);
        assertEq(f, 120);
    }

    function testFactorialRecursive() public view {
        uint f = basics.factorialOfRecursive(5);
        assertEq(f, 120);
    }

    function testIsPrime() public view {
        assertTrue(basics.isPrime(7));
        assertFalse(basics.isPrime(9));
    }
}

// GetPrimes.sol tests
contract GetPrimesTest is Test {
    GetPrimes public gp;
    _GetPrimes public gpStore;

    function setUp() public {
        gp = new GetPrimes();
        gpStore = new _GetPrimes();
    }

    function testPrimesBelow10() public view {
        uint256[] memory p = gp.getPrimesBelow(10);
        uint256[] memory expected = new uint256[](4);
        expected[0] = 2;
        expected[1] = 3;
        expected[2] = 5;
        expected[3] = 7;

        assertEq(p.length, expected.length);
        for (uint256 i = 0; i < p.length; i++) {
            assertEq(p[i], expected[i]);
        }
    }

    function testStorePrimesBelow10() public {
        gpStore.getPrimesBelow(10);
        assertEq(gpStore.primes(0), 2);
        assertEq(gpStore.primes(1), 3);
        assertEq(gpStore.primes(2), 5);
        assertEq(gpStore.primes(3), 7);
    }
}

// ModularInverse.sol tests
contract ModularInverseTest is Test {
    ModularInverse public mi;

    function setUp() public {
        mi = new ModularInverse();
    }

    function testModularInverse() public view {
        uint inv = mi.mi(3, 11);
        assertEq(inv, 4); // 3*4 mod 11 = 12 mod 11 = 1
    }

    function testRevertOnNoInverse() public {
        vm.expectRevert("No modular inverse exists");
        mi.mi(2, 4);
    }
}

// SquareRoot.sol tests
contract SquareRootTest is Test {
    SquareRoot public sqrtC;

    function setUp() public {
        sqrtC = new SquareRoot();
    }

    function testSqrtPerfectSquare() public view {
        assertEq(sqrtC.sqrt(49), 7);
    }

    function testSqrtNonPerfectSquare() public view {
        assertEq(sqrtC.sqrt(50), 7);
    }
}

// TaylorSeries.sol tests
contract TaylorSeriesTest is Test {
    TaylorSeries public ts;

    function setUp() public {
        ts = new TaylorSeries();
    }

    function testPowerOf() public view {
        int p = ts.powerOf(2, 4);
        assertEq(p, 16);
    }

    function testFactorialOf() public view {
        uint f = ts.factorialOf(5);
        assertEq(f, 120);
    }

    function testETaylorSmallInput() public view {
        int result = ts.eToThePowerX(1, 10); // Approx e^1
        int approx = 2718281828; // e * 1e9
        assertApproxEqAbs(result, approx, 1e5); // allow some error
    }
}