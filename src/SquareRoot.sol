//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SquareRoot {

    function sqrt(uint256 x) public pure returns (uint256){
        
        uint256 sqrtIs;
        for(uint i=1; i*i<=x; i++){
            if(i*i<=x && (i+1)*(i+1)>x){
                sqrtIs = i;
                break;
            }
        }
        return sqrtIs;
    }

    //even if x is not a perfect square it will return the perfect square just below it

    //making sqrt using binary search
    //Binary search is a divide and conquer technique used to search in a sorted space.
    //if i run a for loop does that create a sorted space? does this even make sense?

//    function sqrtBinary(uint256 x) public pure returns (uint256){
//      uint low=1;
//      uint high =x;
//      uint mid = (low+high)/2; 
//      uint256 rt;
//      
//      if(mid^2<=x && (mid+1)^2>x){
//          rt = mid;
//      }
//      return rt;
//      if(mid^2>x){
//          high = mid-1;
//          high--;
//      }
//  }
}