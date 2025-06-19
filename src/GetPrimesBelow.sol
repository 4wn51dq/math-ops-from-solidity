//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

//memory arrays must have fixed size and cannot grow dynamically.
contract GetPrimes {
    function getPrimesBelow(uint256 x) public pure returns (uint256[] memory){
        require(x>=3);

        uint count = 0;
        for(uint i= 2; i<x; i++){
            bool isPrime = true;
            for(uint j=2; j*j<=i; j++){
                if (i%j==0) {
                    isPrime = false;
                }
            }
            if (isPrime){
                count++;
            }
        }

        uint256[] memory primes = new uint256[](count);
        uint256 primeIdx = 0;
        for(uint i= 2; i<x; i++){
            bool isPrime = true;
            for(uint j=2; j*j<=i; j++){
                if (i%j!=0) {
                    isPrime = false;
                    break;
                }
            }
            if(isPrime){
                primes[primeIdx++]= i;
            }
        }
        return primes;
    }
}

//without using memory array and instead using a dynamic array;

import './Basics.sol';

contract _GetPrimes is Basics{
    uint256[] public primes;

    function getPrimesBelow(uint256 x) public {
        
        for(uint i=2; i<x; i++){
            if (isPrime(i)){
                primes.push(i);
            }
        }
    }
}

