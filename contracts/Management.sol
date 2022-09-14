// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../interfaces/Management_Interface.sol";

import "../security/Ownable.sol";
import "../security/Pausable.sol";

import "../utils/array/Arrays_Interface.sol";
import "../utils/compare/Compare_Interface.sol";
import "../utils/Context.sol";
import "../utils/math/SafeMath.sol";
import "../utils/math/PlusMath.sol";

import "./SingleDigitalObject.sol";
import "./PackageDigitalObject.sol";

//1000000000000000000

contract Management is IManagement,
                       Context,
                       Pausable
{ 
    
    mapping ( address => mapping ( PackageDigitalObject => uint256 ) ) private packageDigitalObject;
    mapping ( address => SingleDigitalObject[] )                       private singleDigitalObject;
    
    // ================================ GET ================================
    function getPackageDigitalObjectLicenseOfAddress ( PackageDigitalObject _packageDigitalObject, address _address ) public view virtual override 
                                                                                                                      whenNotPaused() 
                                                                                                                      returns ( uint256 ) 
    {
        return packageDigitalObject[_address][_packageDigitalObject];
    }
    
    function getSingleDigitalObjectLicenseOfAddress ( address _address ) public view virtual override 
                                                                         whenNotPaused() 
                                                                         returns ( SingleDigitalObject[] memory ) 
    {
        return singleDigitalObject[_address];
    } 
    
    // ================================ SET ================================
    function setPackageDigitalObject ( PackageDigitalObject _packageDigitalObject, uint256 _license ) public virtual override  
                                                                                                      whenNotPaused()
    {
        packageDigitalObject[_msgSender()][_packageDigitalObject] = _license;
    }
    
    function setSingleDigitalObject ( SingleDigitalObject _singleDigitalObject ) public virtual override 
                                                                                        whenNotPaused()
    {
        singleDigitalObject[_msgSender()].push(_singleDigitalObject);
    }

    function buyPackageDigitalObject ( PackageDigitalObject _packageDigitalObject, uint256 _license ) public payable virtual override 
                                                                                                             whenNotPaused()
    {
        _packageDigitalObject.payActorOfPackage { value:_msgValue() } ( _license );
        setPackageDigitalObject( _packageDigitalObject, _license );
        emit LicenseOfPackage( _msgSender(), _packageDigitalObject, _license );
    }

    function buySingleDigitalObject ( PackageDigitalObject _packageDigitalObject, SingleDigitalObject _singleDigitalObject ) public payable virtual override 
                                                                                                                             whenNotPaused()
    {
        
        _packageDigitalObject.payActorOfSingle { value:_msgValue() } ( _singleDigitalObject, 0 );
        setSingleDigitalObjectLicense( _singleDigitalObject );
        emit LicenseOfSingle( _msgSender(), _packageDigitalObject, _singleDigitalObject, 0 );
    } 
    
    function upgradeLicenseOfPackage ( PackageDigitalObject _packageDigitalObject, uint256 _license) public payable virtual override 
                                                                                                     whenNotPaused()
    {
        require (
            packageDigitalObject[_msgSender()][_packageDigitalObject] > 0 && 
            packageDigitalObject[_msgSender()][_packageDigitalObject] < _license );

        uint256 priceDifference = _packageDigitalObject.getLicense().priceDifferenceOfLicense(
                                                                    packageDigitalObject[_msgSender()][_packageDigitalObject],
                                                                    _license );
        require ( _msgValue() == priceDifference );
        buyPackageDigitalObjectLicense( _packageDigitalObject, _license );
        
        emit LicenseOfPackage( _msgSender(), _packageDigitalObject, _license );
    }
    

}
