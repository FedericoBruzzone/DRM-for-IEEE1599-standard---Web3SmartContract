// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @dev Collection of function related to Block and Transaction Properties
 *
 * There are special variables and functions which always exist in the 
 * global namespace and are mainly used to provide information about the blockchain or are general-use utility functions.
 *
 * The values of all members of msg, including msg.sender and msg.value can change for every external function call. This includes calls to library functions.
 * 
 * When contracts are evaluated off-chain rather than in context of a transaction included in a block, you should not assume that block.* and tx.* 
 * refer to values from any specific block or transaction. These values are provided by the EVM implementation that executes the contract and can be arbitrary.
 * 
 * Do not rely on block.timestamp or blockhash as a source of randomness, unless you know what you are doing.
 * Both the timestamp and the block hash can be influenced by miners to some degree. Bad actors in the mining community can 
 * for example run a casino payout function on a chosen hash and just retry a different hash if they did not receive any money.
 * The current block timestamp must be strictly larger than the timestamp of the last block, but the only guarantee is that it will be somewhere 
 * between the timestamps of two consecutive blocks in the canonical chain.
 *
 * The block hashes are not available for all blocks for scalability reasons. You can only access the hashes of the most recent 256 blocks, all other values will be zero.
 */ 
abstract contract Context {

    /**
     * @dev Return the sender of the message (current call)
     */
    function _msgSender () internal view virtual 
                           returns ( address ) 
    {
        return msg.sender;
    }

    /**
     * @dev Return the number of wei sent with the message
     */
    function _msgValue () internal view virtual 
                          returns ( uint256 ) 
    {
        return msg.value;
    }

    /**
     * @dev Return complete calldata
     */
    function _msgData () internal view virtual 
                         returns ( bytes calldata ) 
    {
        return msg.data;
    }

    /**
     * @dev Return the first four bytes of the calldata (i.e. function identifier)
     */
    function _msgSig () internal view virtual 
                        returns ( bytes4 ) 
    {
        return msg.sig;
    }

    /**
     * @dev Return the hash of the given block when blocknumber is one of the 256 most recent blocks; otherwise returns zero
     */
    function _blockHash ( uint blockNumber) internal view virtual 
                                            returns ( bytes32 )
    {
        return blockhash( blockNumber );
    }

    /**
     * @dev Return the current block’s base fee (EIP-3198 and EIP-1559)
     */
    function _blockBasefee () internal view virtual 
                              returns ( uint )
    {
        return block.basefee;
    }

    /**
     * @dev Return the current chain id
     */
    function _blockChainid () internal view virtual 
                              returns ( uint )
    {
        return block.chainid;
    }

    /**
     * @dev Return the current block miner’s address
     */
    function _blockCoinbase () internal view virtual 
                               returns ( address payable )
    {
        return block.coinbase;
    }
    
    /**
     * @dev Return the current block difficulty
     */
    function _blockDifficulty () internal view virtual 
                                 returns ( uint )
    {
        return block.difficulty;
    }

    /**
     * @dev Return the current block gaslimit
     */
    function _blockGaslimit () internal view virtual 
                               returns ( uint )
    {
        return block.gaslimit;
    }

    /**
     * @dev Return the current block number
     */
    function _blockNumber () internal view virtual 
                             returns ( uint )
    {
        return block.number;
    }

    /**
     * @dev Return the current block timestamp as seconds since unix epoch
     */
    function _blockTimestamp () internal view virtual 
                                returns ( uint )
    {
        return block.timestamp;
    }

    /**
     * @dev Return the remaining gas
     */
    function _gasleft () internal view virtual 
                         returns ( uint256 )
    {
        return gasleft();
    }

    /**
     * @dev Return the  gas price of the transaction
     */
    function _txGasprice () internal view virtual 
                            returns ( uint )
    {
        return tx.gasprice;
    }

    /**
     * @dev Return the sender of the transaction (full call chain)
     */
    function _txOrigin () internal view virtual 
                          returns ( address )
    {
        return tx.origin;
    }

    

}
