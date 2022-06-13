// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../interfaces/License_Interface.sol";

import "../security/Ownable.sol";
import "../security/Pausable.sol";

import "../utils/array/Arrays_Interface.sol";
import "../utils/Context.sol";

import "../utils/math/SafeMath.sol";

contract License is ILicense,
                    Context,
                    Ownable,
                    Pausable
{
    
    mapping ( uint256 => uint256 ) private licenseToPrice;
    uint256                        private numberOfLicense;
    
    modifier IsLicense( uint256 _license ) 
    {
        isLicense(_license);
        _;
    }

    constructor ()
    {
        licenseToPrice[0] = 0;        // for Single Digital Object
        licenseToPrice[1] = 0;        // free trial
        licenseToPrice[2] = 10 ether; //1 ether;  // small license
        licenseToPrice[3] = 15 ether; //1.5 ether;  // basic license
        licenseToPrice[4] = 20 ether; //2 ether;  // full license
        numberOfLicense   = 5;
    }


    function getPriceOfLicense ( uint256 _license ) external view virtual override 
                                                    whenNotPaused() 
                                                    returns ( uint256 )
    {
        return licenseToPrice[_license];
    }

    function getNumberOfLicense () external view virtual override 
                                   whenNotPaused() 
                                   returns ( uint256 )
    {
        return numberOfLicense;
    }

    function isLicense ( uint256 _license ) public view virtual override 
                                            whenNotPaused() 
                                            returns ( bool )
    {
        if ( _license == 0 || _license == 1 )
        {
            return true;
        }
        return ( licenseToPrice[_license] > 0 );
    }

    function setLicense ( uint256 _price ) external virtual override 
                                           whenNotPaused()
    {
        licenseToPrice[numberOfLicense] = _price;
        numberOfLicense = SafeMath.add( numberOfLicense, 1 );
        emit AddLicense( licenseToPrice[numberOfLicense], _price ); 
    }

    function setPriceOfLicense ( uint256 _license, uint256 _price ) external virtual override 
                                                                    whenNotPaused()
    {
        if ( isLicense( _license ) )
        {
            licenseToPrice[_license] = _price;
        }
        emit AddLicense( _license, _price );  
    }
    
    function priceDifferenceOfLicense ( uint256 _newLicense, uint256 _oldLicense ) external virtual override 
                                                                                   whenNotPaused() 
                                                                                   returns ( uint256 ) 
    { 

        uint256 priceDifference = SafeMath.sub( licenseToPrice[_newLicense], licenseToPrice[_oldLicense] );
        emit PriceDifference( licenseToPrice[_newLicense], licenseToPrice[_oldLicense], priceDifference );
        return priceDifference;
    }

}