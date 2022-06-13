// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @dev Collection of functions related to uint/int safe cast 
 */

library SafeCast 
{
    /**
     * @dev Returns the downcasted uint224 from uint256, reverting on
     * overflow (when the input is greater than largest uint224).
     */
    function toUint224 ( uint256 value ) internal pure 
                                         returns ( uint224 ) 
    {
        require( value <= type( uint224 ).max, "SafeCast: value doesn't fit in 224 bits" );
        return uint224(value);
    }

    /**
     * @dev Returns the downcasted uint128 from uint256, reverting on
     * overflow (when the input is greater than largest uint128).
     */
    function toUint128 ( uint256 value ) internal pure 
                                         returns ( uint128 ) 
    {
        require( value <= type( uint128 ).max, "SafeCast: value doesn't fit in 128 bits" );
        return uint128(value);
    }

    /**
     * @dev Returns the downcasted uint96 from uint256, reverting on
     * overflow (when the input is greater than largest uint96).
     */
    function toUint96( uint256 value ) internal pure 
                                       returns ( uint96 ) 
    {
        require( value <= type( uint96 ).max, "SafeCast: value doesn't fit in 96 bits" );
        return uint96( value );
    }

    /**
     * @dev Returns the downcasted uint64 from uint256, reverting on
     * overflow (when the input is greater than largest uint64).
     */
    function toUint64( uint256 value ) internal pure 
                                       returns ( uint64 ) 
    {
        require( value <= type( uint64 ).max, "SafeCast: value doesn't fit in 64 bits" );
        return uint64( value );
    }

    /**
     * @dev Returns the downcasted uint32 from uint256, reverting on
     * overflow (when the input is greater than largest uint32).
     */
    function toUint32( uint256 value ) internal pure    
                                       returns ( uint32 ) 
    {
        require( value <= type( uint32 ).max, "SafeCast: value doesn't fit in 32 bits" );
        return uint32( value );
    }

    /**
     * @dev Returns the downcasted uint16 from uint256, reverting on
     * overflow (when the input is greater than largest uint16).
     */
    function toUint16( uint256 value ) internal pure 
                                       returns ( uint16 ) 
    {
        require( value <= type( uint16 ).max, "SafeCast: value doesn't fit in 16 bits" );
        return uint16( value );
    }

    /**
     * @dev Returns the downcasted uint8 from uint256, reverting on
     * overflow (when the input is greater than largest uint8).
     */
    function toUint8( uint256 value ) internal pure 
                                      returns ( uint8 ) 
    {
        require( value <= type( uint8 ).max, "SafeCast: value doesn't fit in 8 bits" );
        return uint8( value );
    }

    /**
     * @dev Converts a signed int256 into an unsigned uint256.
     */
    function toUint256( int256 value ) internal pure 
                                       returns ( uint256 ) 
    {
        require( value >= 0, "SafeCast: value must be positive" );
        return uint256( value );
    }

    /**
     * @dev Returns the downcasted int128 from int256, reverting on
     * overflow (when the input is less than smallest int128 or
     * greater than largest int128).
     */
    function toInt128( int256 value ) internal pure 
                                      returns ( int128 ) 
    {
        require( value >= type( int128 ).min && value <= type( int128 ).max, "SafeCast: value doesn't fit in 128 bits");
        return int128( value );
    }

    /**
     * @dev Returns the downcasted int64 from int256, reverting on
     * overflow (when the input is less than smallest int64 or
     * greater than largest int64).
     */
    function toInt64( int256 value ) internal pure 
                                     returns ( int64 ) 
    {
        require( value >= type( int64 ).min && value <= type( int64 ).max, "SafeCast: value doesn't fit in 64 bits" );
        return int64( value );
    }

    /**
     * @dev Returns the downcasted int32 from int256, reverting on
     * overflow (when the input is less than smallest int32 or
     * greater than largest int32).
     */
    function toInt32( int256 value ) internal pure 
                                     returns ( int32 ) 
    {
        require( value >= type( int32 ).min && value <= type( int32 ).max, "SafeCast: value doesn't fit in 32 bits" );
        return int32( value );
    }

    /**
     * @dev Returns the downcasted int16 from int256, reverting on
     * overflow (when the input is less than smallest int16 or
     * greater than largest int16).
     */
    function toInt16( int256 value ) internal pure 
                                     returns ( int16 ) 
    {
        require( value >= type( int16 ).min && value <= type( int16 ).max, "SafeCast: value doesn't fit in 16 bits" );
        return int16( value );
    }

    /**
     * @dev Returns the downcasted int8 from int256, reverting on
     * overflow (when the input is less than smallest int8 or
     * greater than largest int8).
     */
    function toInt8( int256 value ) internal pure 
                                    returns ( int8 ) 
    {
        require( value >= type( int8 ).min && value <= type( int8 ).max, "SafeCast: value doesn't fit in 8 bits" );
        return int8( value );
    }

    /**
     * @dev Converts an unsigned uint256 into a signed int256.
     */
    function toInt256( uint256 value ) internal pure 
                                       returns ( int256 ) 
    {
        // Note: Unsafe cast below is okay because `type(int256).max` is guaranteed to be positive
        require( value <= uint256( type( int256 ).max ), "SafeCast: value doesn't fit in an int256" );
        return int256( value );
    }
}
