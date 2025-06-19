//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Basics {

    function summation(uint n) public pure returns (uint sum) {
        require(n>0, 'kiska sum brdr');
        
        sum = 0;
        for (uint i=1; i<=n; i++){
            sum=sum+i;
        }
        return sum;

        // return n*(n+1)/2
    }


    function factorialOfIterative(uint256 n) public pure returns (uint256 factorial) { 
        require (n>0, 'input must be positive');
        require (n<20, '20!>2^256 -1');

        factorial = 1;
        for(uint i= 1; i<=n; i++){
            factorial= factorial*i;
        }
        return factorial;
    }

    function factorialOfRecursive(uint n) public pure returns (uint256){
        require (n>0, 'input must be positive');
        require (n<20, '20!>2^256 -1');

        n==1 ? 1: n*factorialOfRecursive(n-1);
    }

    function isPrime(uint n) public pure returns (bool) {
        require(n>2, 'input must be greater than 2');

        for(uint i= 2; i<n; i++){
            if (n%i == 0){
                return false;
            }
        }
        return true;
    }
}