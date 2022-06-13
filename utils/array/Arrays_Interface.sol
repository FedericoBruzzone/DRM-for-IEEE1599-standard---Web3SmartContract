// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Arrays.sol";

/**
 * @dev Collection of modifiers related to array types.
 *
 * To use modifiers in contract function signatures, modifiers must be within an interface or contract,
 * cannot be inside a library. 
 * 
 * For this you use an interface or a contract that implements them within it.
 */

interface IArrays
{   
    /**
     * @dev Check if the (address)(`_array`) length is less than or equal to (`_n`)
     */
    modifier AddressGreaterThen ( address[] memory _array, uint256 _n ) 
    {
        require( Arrays.addressGreaterThenN ( _array, _n ) );
        _;
    }

    /**
     * @dev Check if the (address)(`_array`) length is greater then 0
     */
    modifier AddressGreaterThenZero ( address[] memory _array ) 
    {
        require( Arrays.addressGreaterThenZeroN ( _array ) );
        _;
    }

    /**
     * @dev Check if the (address payable)(`_array`) length is less than or equal to (`_n`)
     */
    modifier AddressPayableGreaterThen ( address payable[] memory _array, uint256 _n ) 
    {
        require( Arrays.addressPayableGreaterThenN ( _array, _n ) );
        _;
    }

    /**
     * @dev Check if the (address payable)(`_array`) length is greater then 0
     */
    modifier AddressPayableGreaterThenZero ( address payable[] memory _array ) 
    {
        require( Arrays.addressPayableGreaterThenZeroN ( _array ) );
        _;
    }
    
     /**
     * @dev Check if the (uint256)(`_array`) length is less than or equal to (`_n`)
     */
    modifier UintGreaterThen ( uint256[] memory _array, uint256 _n ) 
    {
        require( Arrays.uintGreaterThenN ( _array, _n ) );
        _;
    }

    /**
     * @dev Check if the (uint256)(`_array`) length is greater then 0
     */
    modifier UintGreaterThenZero ( uint256[] memory _array ) 
    {
        require( Arrays.uintGreaterThenZeroN ( _array ) );
        _;
    }


}