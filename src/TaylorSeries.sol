//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TaylorSeries {

    function factorialOf(uint256 n) public pure returns (uint256 factorial) { 
        require (n<20, '20!>2^256 -1');

        if(n==0){
            return 1; 
            //we cannot restrict condition for n=0 input because taylot series would 
            //require the value for 0! so we just define it separately.
        }
        factorial = 1;
        for(uint i= 1; i<=n; i++){
            factorial= factorial*i;
        }
        return factorial;
    }

    function powerOf(int256 a, uint256 b) public pure returns(int256){
        int256 m = 1;
        for (uint i=1; i<=b; i++){
            m=m*a;
        }
        return m;
        //b has to be an unsigned integer.. why? because a loop 'counts' and here counting
        //negatively is not applicable.
        //logic applied is multiply a by itself b times
    }
    
    
    function eToThePowerX(int256 x, uint256 n) public pure returns (int256){
        require(n<20, '20!>2^256 -1');
        
        int256 ePowerX = 0;
        int256 SCALE = 1e18;
        for(uint i=0; i<=n; i++){
            
            ePowerX+= (powerOf(x, i)*SCALE)/int256(factorialOf(i));
            //factorial is uint so we typecast it so operations make sense for solidity
            //why scale? because each term in the sum is a fraction and solidity solves it like you know 
            //it does. So to get better approximation we multiply it by 1e18
        }
        return ePowerX;
    }
}