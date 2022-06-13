// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Compare.sol";

/**
 * @dev Collection of functions related to compare elements.
 *
 * To use modifiers in contract function signatures, modifiers must be within an interface or contract,
 * cannot be inside a library. 
 * 
 * For this you use an interface or a contract that implements them within it.
 */

interface ICompare {

    /**
     * @dev Check if the (string)(`_a`) is equal to (string)(`_b`)
     */
    modifier compareStrings ( string memory _a, string memory _b  ) 
    {
        require ( Compare.compareStrings( _a, _b ) );
        _;
    }

    /**
     * @dev Check if the (uint256)(`_a`) is equal to (uint256)(`_b`)
     */
    modifier compareUint256 ( uint256 _a, uint256 _b  ) 
    {
        require ( Compare.compareUint256( _a, _b ) );
        _;
    }

    /**
     * @dev Check if the (uint256)(`_a`) is greater than zero
     */
    modifier nGreaterThenZero ( uint256 _a ) 
    {
        require ( Compare.nGreaterThenZero( _a ) );
        _;
    }
}