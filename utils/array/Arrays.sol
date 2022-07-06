// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../math/PlusMath.sol";

/**
 * @dev Collection of functions related to array types.
 */

library Arrays 
{
    /**
     * @dev Check if the (address)(`_array`) length is less than or equal to (`_n`)
     */
    modifier AddressGreaterThen ( address[] memory _array, uint256 _n ) 
    {
        require( _array.length <= _n, "Array: contains too many elements" );
        _;
    }

    /**
     * @dev Check if the (address)(`_array`) length is greater then 0
     */
    modifier AddressGreaterThenZero ( address[] memory _array ) 
    {
        require( _array.length > 0, "Array: contains zero elements" );
        _;
    }

    /**
     * @dev Check if the (address payable)(`_array`) length is less than or equal to (`_n`)
     */
    modifier AddressPayableGreaterThen ( address payable[] memory _array, uint256 _n ) 
    {
        require( _array.length <= _n, "Array: contains too many elements" );
        _;
    }

    /**
     * @dev Check if the (address payable)(`_array`) length is greater then 0
     */
    modifier AddressPayableGreaterThenZero ( address payable[] memory _array ) 
    {
        require( _array.length > 0, "Array: contains zero elements" );
        _;
    }

    /**
     * @dev Check if the (uint256)(`_array`) length is less than or equal to (`_n`)
     */
    modifier UintGreaterThen ( uint256[] memory _array, uint256 _n ) 
    {
        require( _array.length <= _n, "Array: contains too many elements" );
        _;
    }

    /**
     * @dev Check if the (uint256)(`_array`) length is greater then 0
     */
    modifier UintGreaterThenZero ( uint256[] memory _array ) 
    {
        require( _array.length > 0, "Array: contains zero elements" );
        _;
    }

    /**
     * @dev This function returns true if the (address)(`_array`) length is less than or equal to (`_n`)
     *
     * Requirements:
     *
     * - The (address)(`_array`) length must be less than or equal to (`_n`).
     */
    function addressGreaterThenN ( address[] memory _array, uint256 _n ) internal pure 
                                                                         AddressGreaterThen ( _array, _n ) 
                                                                         returns ( bool )
    {
        return true;
    }

    /**
     * @dev This function returns true if the (address)(`_array`) length is greater than 0
     *
     * Requirements:
     *
     * - The (address)(`_array`) length must be greater than 0.
     */
    function addressGreaterThenZeroN ( address[] memory _array ) internal pure 
                                                                 AddressGreaterThenZero ( _array ) 
                                                                 returns ( bool ) 
    {
        return true;
    }

    /**
     * @dev This function returns true if the (address payable)(`_array`) length is less than or equal to (`_n`)
     *
     * Requirements:
     *
     * - The (address payable)(`_array`) length must be less than or equal to (`_n`).
     */
    function addressPayableGreaterThenN ( address payable[] memory _array, uint256 _n ) internal pure 
                                                                                        AddressPayableGreaterThen ( _array, _n ) 
                                                                                        returns ( bool )
    {
        return true;
    }

    /**
     * @dev This function returns true if the (address payable)(`_array`) length is greater than 0
     *
     * Requirements:
     *
     * - The (address payable)(`_array`) length must be greater than 0.
     */
    function addressPayableGreaterThenZeroN ( address payable[] memory _array ) internal pure 
                                                                                AddressPayableGreaterThenZero ( _array ) 
                                                                                returns ( bool ) 
    {
        return true;
    }

    /**
     * @dev This function returns true if the (uint256)(`_array`) length is less than or equal to (`_n`)
     *
     * Requirements:
     *
     * - The (uint256)(`_array`) length must be less than or equal to (`_n`).
     */
    function uintGreaterThenN ( uint256[] memory _array, uint256 _n ) internal pure 
                                                                      UintGreaterThen ( _array, _n ) 
                                                                      returns ( bool ) 
    {
        return true;
    }

    /**
     * @dev This function returns true if the (uint256)(`_array`) length is greater than 0
     *
     * Requirements:
     *
     * - The (address payable)(`_array`) length must be greater than 0.
     */
    function uintGreaterThenZeroN ( uint256[] memory _array ) internal pure 
                                                              UintGreaterThenZero ( _array ) 
                                                              returns ( bool )
    {
        return true;
    }

    
    /**
     * @dev This function returns true if the (address)(`_address`) is in the (address)(`_array`)
     */
    function elementSearch ( address [] memory _array, address _address )  internal pure returns ( bool )
    {
        for ( uint256 i = 0; i < _array.length; i++)
        {
            if ( _array[i] == _address )
            {
                return true;
            }
        }

        return false;
    }

    /**
     * @dev This function returns the highest number in the (uint256)(`_array`)
     */
    function findHighestNumbers ( uint256[] memory _array ) internal pure returns ( uint256 ) 
    {
        require ( _array.length > 0 ); 
        uint256 maxNumber; 

        for ( uint256 i = 0; i < _array.length; i++ ) 
        {
            if ( _array[i] > maxNumber ) 
            {
                maxNumber = _array[i];
            }
        }

        return maxNumber;
    }
    
    function findUpperBound ( uint256[] memory _array, uint256 _element ) internal pure returns ( uint256 ) 
    {
        if (_array.length == 0) {
            return 0;
        }

        uint256 low = 0;
        uint256 high = _array.length;

        while (low < high) {
            uint256 mid = PlusMath.average(low, high);
            if (_array[mid] > _element) {
                high = mid;
            } else {
                low = mid + 1;
            }
        }

        if (low > 0 && _array[low - 1] == _element) {
            return low - 1;
        } else {
            return low;
        }
    }

}



