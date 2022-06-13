// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @dev Collection of functions related to compare elements.
 * 
 * ABI:
 * The Contract Application Binary Interface (ABI) is the standard way to interact with contracts in the Ethereum ecosystem, 
 * both from outside the blockchain and for contract-to-contract interaction. Data is encoded according to its type, 
 * as described in this specification. The encoding is not self describing and thus requires a schema in order to decode.
 *
 * We assume the interface functions of a contract are strongly typed, known at compilation time and static. 
 * We assume that all contracts will have the interface definitions of any contracts they call available at compile-time.
 * 
 * Non-standard Packed Mode:
 * Through abi.encodePacked(), Solidity supports a non-standard packed mode where:
 *    - types shorter than 32 bytes are concatenated directly, without padding or sign extension
 *    - dynamic types are encoded in-place and without the length.
 *    - array elements are padded, but still encoded in-place
 *
 * More specifically:
 * - During the encoding, everything is encoded in-place. This means that there is no distinction between head and tail, 
 *   as in the ABI encoding, and the length of an array is not encoded.
 * - The direct arguments of abi.encodePacked are encoded without padding, as long as they are not arrays (or string or bytes).
 * - The encoding of an array is the concatenation of the encoding of its elements with padding.
 * - Dynamically-sized types like string, bytes or uint[] are encoded without their length field.
 * - The encoding of string or bytes does not apply padding at the end unless it is part of an array or struct (then it is padded to a multiple of 32 bytes).
 * 
 * Warning:
 * If you use keccak256(abi.encodePacked(a, b)) and both a and b are dynamic types, 
 * it is easy to craft collisions in the hash value by moving parts of a into b and vice-versa. 
 * More specifically, abi.encodePacked("a", "bc") == abi.encodePacked("ab", "c"). 
 * If you use abi.encodePacked for signatures, authentication or data integrity, make sure to always use the same types and check that at most one of them is dynamic. 
 * Unless there is a compelling reason, abi.encode should be preferred.
 */
library Compare {

    /**
     * @dev Check if the (string)(`_a`) is equal to (string)(`_b`)
     */
    modifier compareStringsI ( string memory _a, string memory _b  ) 
    {
        require ( keccak256 ( abi.encodePacked( ( _a ) ) ) == keccak256 ( abi.encodePacked ( ( _b ) ) ), "Compare Strings: the two strings are not the same" );
        _;
    }

    /**
     * @dev Check if the (uint256)(`_a`) is equal to (uint256)(`_b`)
     */
    modifier compareUint256I ( uint256 _a, uint256 _b  ) 
    {
        require ( keccak256 ( abi.encodePacked( ( _a ) ) ) == keccak256 ( abi.encodePacked( ( _b ) ) ), "Compare Uint256: the two uint256 are not the same" );
        _;
    }

    /**
     * @dev Check if the (uint256)(`_a`) is greater than zero
     */
    modifier nGreaterThenZeroI ( uint256 _a ) 
    {
        require ( _a > 0, "Compare Uint256: the uint256 is not greater then zero" );
        _;
    }

    /**
     * @dev This function returns true if the (string)(`_a`) is equal to (string)(`_b`)
     *
     * Requirements:
     *
     * - The (string)(`_a`) must be equal to (string)(`_b`)
     */
    function compareStrings ( string memory _a, string memory _b ) internal pure 
                                                                   compareStringsI(_a, _b) 
                                                                   returns ( bool ) 
    {
        return true;
    }

    /**
     * @dev This function returns true if the (uint256)(`_a`) is equal to (uint256)(`_b`)
     *
     * Requirements:
     *
     * - The (uint256)(`_a`) must be equal to (uint256)(`_b`)
     */
    function compareUint256 ( uint256 _a, uint256 _b ) internal pure 
                                                       compareUint256I(_a, _b) 
                                                       returns ( bool ) 
    {
        return true;
    }

    /**
     * @dev This function returns true if the (uint256)(`_a`) is greater than 0
     *
     * Requirements:
     *
     * - The (uint256)(`_a`) must be greater than 0
     */
    function nGreaterThenZero ( uint256 _a ) internal pure 
                                             nGreaterThenZeroI(_a) 
                                             returns ( bool ) 
    {
        return true;
    }

}