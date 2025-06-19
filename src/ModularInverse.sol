//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ModularInverse{
    function mi(uint256 x, uint256 m) public pure returns (uint256){

        require (m>1);
        for(uint i=1; i<=m; i++){
            if((x*i)%m !=1 ){
                return i;
            }
        } 
        revert ('modular inverse doesnt exist');
    }
}

//brute forcing logic, very gas-inefficient for large values!!!!