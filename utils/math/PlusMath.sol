// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SafeMath.sol";

/**
 * @dev Collection of functions related to "advanced" mathematical operations
 */

library PlusMath {
    /**
     * @dev Returns the percentage ( b ) of a number ( a )
     */
    function percentage ( uint256 a, uint256 b ) internal pure 
                                                 returns ( uint256 ) 
    {
        return SafeMath.div ( SafeMath.mul ( a, b ), 100 );
    }
}