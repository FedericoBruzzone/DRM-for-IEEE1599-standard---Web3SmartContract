// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @dev Interface of the SingleDigitalObject contract
 */

interface ISingleDigitalObject 
{
    
    enum typeT 
           { 
                AUDIO, // 0
                SCORE, // 1
                VIDEO  // 2
            }
    
    /** 
     * @dev This function returns the name of this SingleDigitalObject
     */
    function getName ( ) external view returns ( string memory );

    /** 
     * @dev This function returns the symbol of this SingleDigitalObject
     */
    function getSymbol ( ) external view returns ( string memory );

    /** 
     * @dev This function returns the age of this SingleDigitalObject
     */
    function getAge ( ) external view returns ( uint256 );
    
    /** 
     * @dev This function returns the type of this SingleDigitalObject
     */
    function getType ( ) external view returns ( typeT );

    /** 
     * @dev This function returns the price of this SingleDigitalObject
     */
    function getPrice ( ) external view returns ( uint256 );
    
    /** 
     * @dev This function returns the ieee of this SingleDigitalObject
     */
    function getIeee1599 ( ) external view returns ( address );

    /** 
     * @dev This function returns the actor of this SingleDigitalObject
     */
    function getActor ( ) external view returns ( address[] memory );

    /** 
     * @dev This function returns the company of this SingleDigitalObject
     */
    function getCompany ( ) external view returns ( address[] memory );

    /** 
     * @dev This function returns the company of this SingleDigitalObject
     */
    function getSynchronization ( ) external view returns ( address[] memory );

    /** 
     * @dev This function returns the number of actors of this SingleDigitalObject
     */
    function getNumActor ( ) external view returns ( uint256 );

    /** 
     * @dev This function returns the number of company of this SingleDigitalObject
     */
    function getNumCompany ( ) external view returns ( uint256 );

    /** 
     * @dev This function returns the number of synchronization (actor) of this SingleDigitalObject
     */
    function getNumSynchronization ( ) external view returns ( uint256 );
   
    /** 
     * @dev This function returns the distribution of this SingleDigitalObject
     */
    function getDistribution (  ) external view returns ( uint256[] memory );

    /** 
     * @dev This function set the name of this SingleDigitalObject
     */
    function setName ( string memory _name ) external;

    /** 
     * @dev This function set the symbol of this SingleDigitalObject
     */
    function setSymbol ( string memory _symbol ) external;

    /** 
     * @dev This function set the age of this SingleDigitalObject
     */
    function setAge ( uint256 _age ) external;

    /** 
     * @dev This function set the type of this SingleDigitalObject
     */
    function setType ( typeT _type ) external;

    /** 
     * @dev This function set the price of this SingleDigitalObject
     */
    function setPrice ( uint256 _price ) external;

    /** 
     * @dev This function adds the ( `_actor` ) to the actor array 
     */
    function setActor ( address[] memory _actor ) external;
    
    /** 
     * @dev This function adds the ( `_company` ) to the company array 
     */
    function setCompany ( address[] memory _company ) external;
    
    /** 
     * @dev This function adds the ( `_synchronization` ) to the synchronization array 
     */
    function setSynchronization ( address[] memory _synchronization ) external;
    
    /** 
     * @dev This function set the new distribution 
     */
    function setDistribution ( uint256[] memory _distribution ) external;
    

    
}