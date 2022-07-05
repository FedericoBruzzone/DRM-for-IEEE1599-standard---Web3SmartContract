// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @dev Interface of the License contract
 */
interface ILicense 
{
    /** 
     * @dev Emitted when a new license is added
     */
    event AddLicense ( uint256, uint256 ); 

    /** 
     * @dev Emitted when a new price is calculated.
     */
    event PriceDifference ( uint256, uint256, uint256 ); // newPrice, oldPrice, differencePrice

    /** 
     * @dev This function returns the price of (uint256)( `_license` )
     */
    function getPriceOfLicense ( uint256 _license ) external view returns ( uint256 );

    /** 
     * @dev This function returns the number of licenses
     */
    function getNumberOfLicense ( ) external view returns ( uint256 );

    /** 
     * @dev This function returns true if the (uint256)( `_license` ) exist
     */
    function isLicense ( uint256 _license ) external view returns ( bool );

    /** 
     * @dev This function adds to licenseToPrice map in position numberOfLicense the ( `_price` ) 
     */
    function setLicense ( uint256 _price ) external; 

    /** 
     * @dev This function set the (uint256)( `_price` ) of (uint256)( `_license` )
     */
    function setPriceOfLicense ( uint256 _license, uint256 _price ) external; 
    
    /** 
     * @dev This function returns the price difference between (uint256)( `_newLicense` ) and (uint256)( `_oldLicense` )
     */
    function priceDifferenceOfLicense ( uint256 _newLicense, uint256 _oldLicense ) external returns ( uint256 );
}
