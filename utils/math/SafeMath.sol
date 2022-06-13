// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @dev Collection of functions related to mathematical operation
 *
 * Checked or Unchecked Arithmetic:
 * An overflow or underflow is the situation where the resulting value of an arithmetic operation, 
 * when executed on an unrestricted integer, falls outside the range of the result type.
 * 
 * Prior to Solidity 0.8.0, arithmetic operations would always wrap in case of under- or 
 * overflow leading to widespread use of libraries that introduce additional checks.
 * Since Solidity 0.8.0, all arithmetic operations revert on over- and 
 * underflow by default, thus making the use of these libraries unnecessary.
 *
 * The unchecked block can be used everywhere inside a block, but not as a replacement for a block. It also cannot be nested.
 * The setting only affects the statements that are syntactically inside the block. Functions called from within an unchecked block do not inherit the property.
 * 
 * The following operators will cause a failing assertion on overflow or underflow and will wrap without an error if used inside an unchecked block:
 * ++, --, +, binary -, unary -, *, /, %, **
 * It is not possible to disable the check for division by zero or modulo by zero using the unchecked block.
 */

library SafeMath 
{
    /**
     * @dev Returns the addition of two unsigned integers, with an overflow flag.
     */
    function tryAdd ( uint256 a, uint256 b ) internal pure 
                                             returns ( bool, uint256 ) 
    {
        unchecked 
        {
            uint256 c = a + b;
            if ( c < a ) return ( false, 0 );
            return ( true, c );
        }
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, with an overflow flag.
     */
    function trySub(uint256 a, uint256 b) internal pure 
                                          returns ( bool, uint256 ) 
    {
        unchecked 
        {
            if ( b > a ) return ( false, 0 );
            return ( true, a - b );
        }
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, with an overflow flag.
     */
    function tryMul ( uint256 a, uint256 b ) internal pure 
                                             returns ( bool, uint256 ) 
    {
        unchecked 
        {
            if ( a == 0 ) return ( true, 0 );
            uint256 c = a * b;
            if ( c / a != b ) return ( false, 0 );
            return ( true, c );
        }
    }

    /**
     * @dev Returns the division of two unsigned integers, with a division by zero flag.
     */
    function tryDiv ( uint256 a, uint256 b ) internal pure 
                                             returns ( bool, uint256 ) 
    {
        unchecked 
        {
            if ( b == 0 ) return ( false, 0 );
            return ( true, a / b );
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers, with a division by zero flag.
     */
    function tryMod ( uint256 a, uint256 b ) internal pure 
                                             returns ( bool, uint256 ) 
    {
        unchecked 
        {
            if ( b == 0 ) return ( false, 0 );
            return ( true, a % b );
        }
    }

    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     */
    function add ( uint256 a, uint256 b ) internal pure 
                                          returns ( uint256 ) 
    {
        return a + b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     */
    function sub ( uint256 a, uint256 b ) internal pure 
                                          returns ( uint256 ) 
    {
        return a - b;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     */
    function mul ( uint256 a, uint256 b ) internal pure 
                                          returns ( uint256 ) 
    {
        return a * b;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting on
     * division by zero. The result is rounded towards zero.
     */
    function div ( uint256 a, uint256 b ) internal pure 
                                          returns ( uint256 ) 
    {
        return a / b;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting when dividing by zero.
     */
    function mod ( uint256 a, uint256 b ) internal pure 
                                          returns ( uint256 ) 
    {
        return a % b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     */
    function sub ( uint256 a, uint256 b, string memory errorMessage ) internal pure 
                                                                      returns (uint256) 
    {
        unchecked 
        {
            require( b <= a, errorMessage );
            return a - b;
        }
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting with custom message on
     * division by zero. The result is rounded towards zero.
     */
    function div ( uint256 a, uint256 b, string memory errorMessage ) internal pure 
                                                                      returns ( uint256 ) 
    {
        unchecked 
        {
            require( b > 0, errorMessage );
            return a / b;
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting with custom message when dividing by zero.
     */
    function mod (uint256 a, uint256 b, string memory errorMessage) internal pure 
                                                                    returns ( uint256 ) 
    {
        unchecked 
        {
            require( b > 0, errorMessage );
            return a % b;
        }
    }
}
