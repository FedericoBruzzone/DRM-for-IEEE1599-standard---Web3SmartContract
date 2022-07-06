// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SafeMath.sol";

/**
 * @dev Collection of functions related to "advanced" mathematical operations
 */

library PlusMath {

    /**
     * @dev Returns the largest of two numbers.
     */
    function max ( uint256 a, uint256 b ) internal pure 
                                          returns ( uint256 ) 
    {
        return a > b ? a : b;
    }

    /**
     * @dev Returns the smallest of two numbers.
     */
    function min ( uint256 a, uint256 b ) internal pure 
                                          returns ( uint256 ) 
    {
        return a < b ? a : b;
    }

    /**
     * @dev Returns the average of two numbers. The result is rounded towards
     * zero.
     */
    function average ( uint256 a, uint256 b ) internal pure 
                                              returns ( uint256 ) 
    {
        return ( a & b ) + ( a ^ b ) / 2;
    }

    /**
     * @dev Returns the ceiling of the division of two numbers.
     */
    function ceilDiv ( uint256 a, uint256 b ) internal pure 
                                              returns ( uint256 ) 
    {
        return a / b + ( a % b == 0 ? 0 : 1 );
    }
    
    /**
     * @dev Returns the percentage ( b ) of a number ( a )
     */
    function percentage ( uint256 a, uint256 b ) internal pure 
                                                 returns ( uint256 ) 
    {
        return SafeMath.div ( SafeMath.mul ( a, b ), 100 );
    }
}
