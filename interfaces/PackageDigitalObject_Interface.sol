// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @dev Interface of the PackageDigitalObject contract
 */


//import "./SingleDigitalObject_Interface.sol";
import "../contracts/SingleDigitalObject.sol";
import "../contracts/License.sol";

interface IPackageDigitalObject 
{
    /** 
     * @dev Emitted when amount is moved to account ( `to` )
     */
    event PaidActor ( SingleDigitalObject indexed to, uint256 amount ); 

    /** 
     * @dev Emitted when singelDigitalObject is added this package
     */
    event AddSingleDigitalObject ( SingleDigitalObject singleDigitalObject );

    /** 
     * @dev This function returns the name of this PackageDigitalObject
     */
    function getName ( ) external view returns ( string memory );

    /** 
     * @dev This function returns the symbol of this PackageDigitalObject
     */
    function getSymbol ( ) external view returns ( string memory );

    /** 
     * @dev This function returns the amount of money earned from a ( `_address` )
     */
    function getEarnings ( address _address ) external view returns ( uint256 );

    /** 
     * @dev This function returns the licence of this package
     */

    function getLicense () external view returns ( License );

    /** 
     * @dev This function set the name of this PackageDigitalObject
     */
    function setName ( string memory _name ) external;

    /** 
     * @dev This function set the symbol of this PackageDigitalObject
     */
    function setSymbol ( string memory _symbol ) external;

    /** 
     * @dev This function adds the ( `_singleDigitalObject` ) to the singleDigitalObject array
     */
    function setSingleDigitalObject ( SingleDigitalObject _singleDigitalObject ) external;

    /** 
     * @dev This function distributes money to the actors of a single digital object
     */
    function payActorOfSingle ( SingleDigitalObject _singleDigitalObject, uint256 _license ) external payable;

    /** 
     * @dev This function distributes money to the actors of a package digital object
     */
    function payActorOfPackage ( uint256 _license ) external payable;

    /** 
     * @dev This function distributes money to the actors. This is called by payActorOfSingle and payActorOfPackage.
     */
    function payActor ( SingleDigitalObject _singleDigitalObject, uint256 _amount ) external payable;
    

}