// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @dev Interface of the Management contract
 */
import "../contracts/SingleDigitalObject.sol";
import "../contracts/PackageDigitalObject.sol";

interface IManagement 
{ 
    /** 
     * @dev Emitted when a new package is bought/upgrated
     */
    event LicenseOfPackage ( address who, PackageDigitalObject packageDigitalObject, uint256 license );
    
    /** 
     * @dev Emitted when a new single is bought/upgrated
     */
    event LicenseOfSingle ( address who, PackageDigitalObject packageDigitalObject, SingleDigitalObject singleDigitalObject, uint256 license );


    /** 
     * @dev This function returns the license of ( `address` ) ( `_packageDigitalObject` )
     */
    function getPackageDigitalObjectLicenseOfAddress ( PackageDigitalObject _packageDigitalObject, address _address ) external view returns ( uint256 );


    /** 
     * @dev This function returns the SingleDigitalObject of ( `address` )
     */
    function getSingleDigitalObjectLicenseOfAddress ( address _address ) external view returns ( SingleDigitalObject[] memory ); 


    /** 
     * @dev This function set the license of ( `msg.sender` ) ( `_packageDigitalObject` )
     */
    function setPackageDigitalObject ( PackageDigitalObject _packageDigitalObject, uint256 _license ) external; 


    /** 
     * @dev This function set the SingleDigitalObject of ( `msg.sender` )
     */
    function setSingleDigitalObjectLicense ( SingleDigitalObject _singleDigitalObject ) external; 


    /** 
     * @dev This function allows to buy a package with a certain license
     */
    function buyPackageDigitalObjectLicense ( PackageDigitalObject _packageDigitalObject, uint256 _license ) external payable; 

    
    /** 
     * @dev This function allows to buy a singleDigitalObject 
     */
    function buySingleDigitalObject ( PackageDigitalObject _packageDigitalObject, SingleDigitalObject _singleDigitalObject ) external payable; 
    
    /** 
     * @dev This function allows to upgrade a package with a certain license
     */
    function upgradeLicenseOfPackage ( PackageDigitalObject _packageDigitalObject, uint256 _license) external payable;
     
}