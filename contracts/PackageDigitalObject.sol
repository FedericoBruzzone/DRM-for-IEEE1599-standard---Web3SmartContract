// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../interfaces/PackageDigitalObject_Interface.sol";

import "../security/Ownable.sol";
import "../security/Pausable.sol";

import "../utils/array/Arrays_Interface.sol";
import "../utils/compare/Compare_Interface.sol";
import "../utils/Context.sol";
import "../utils/math/SafeMath.sol";
import "../utils/math/PlusMath.sol";

import "./License.sol";


contract PackageDigitalObject is IPackageDigitalObject, 
                                 Context, 
                                 Ownable,
                                 Pausable, 
                                 IArrays,
                                 ICompare,
                                 License
{
    string                         private name;
    string                         private symbol;
    mapping ( address => uint256 ) private addressToEarnings;
    SingleDigitalObject[]          public singleDigitalObject; // SingleDigitalObject is an address
    License                        public license;
    

    constructor ( string memory _name, 
                  string memory _symbol )
    {
        name    = _name;
        symbol  = _symbol;
        license = new License();
    }

    // ================================ GET ================================
    function getName () public view virtual override 
                        whenNotPaused() 

                        returns ( string memory ) 
    {
        return name;
    }

    function getSymbol () public view virtual override 
                          whenNotPaused() 
                          returns ( string memory ) 
    {
        return symbol;
    }

    function getEarnings ( address _address ) public view virtual override 
                                              whenNotPaused() 
                                              returns ( uint256 )
    {
        return addressToEarnings[_address];
    }

    function getLicense () public view virtual override
                           whenNotPaused()
                           returns ( License )
    {
        return license;
    }

    // ================================ SET ================================
    function setName ( string memory _name ) public virtual  override 
                                             onlyOwner() 
                                             whenNotPaused()
    {
        name = _name;
    }
    
    function setSymbol ( string memory _symbol ) public virtual override 
                                                 onlyOwner() 
                                                 whenNotPaused()
    {
        symbol = _symbol;
    }
    
    function setSingleDigitalObject ( SingleDigitalObject _singleDigitalObject ) public virtual override 
                                                                                 onlyOwner() 
                                                                                 whenNotPaused() 
                                                                                 compareStrings( _singleDigitalObject.getSymbol(), symbol )
    {
        singleDigitalObject.push( _singleDigitalObject );
        emit AddSingleDigitalObject( _singleDigitalObject );
    }
    
    function payActorOfSingle ( SingleDigitalObject _singleDigitalObject, uint256 _license ) public payable virtual override 
                                                                                             whenNotPaused()
                                                                                             nGreaterThenZero( _msgValue() )  
                                                                                             IsLicense( _license )
                                                                                             compareUint256( _singleDigitalObject.getPrice(), _msgValue() )
                                                                                             compareUint256( license.getPriceOfLicense( _license ), 0 )
    {
        payActor( _singleDigitalObject, _msgValue() );
        emit PaidActor( _singleDigitalObject,  _msgValue() ); 
    }

    function payActorOfPackage ( uint256 _license ) public payable virtual override 
                                                                     whenNotPaused()
                                                                     nGreaterThenZero( _msgValue() )
                                                                     IsLicense( _license )
                                                                     compareUint256( license.getPriceOfLicense( _license ), _msgValue() )

    {
       uint256 singleDigitalObjectLength = singleDigitalObject.length;
       uint256 amount = SafeMath.div(  _msgValue(), singleDigitalObjectLength, "There are no SingleDigitalObjects" );
       // we could calculate the amount based on the age of each SingleDigitalObject 
       for ( uint256 i = 0; i < singleDigitalObjectLength; i++ )
       {    
            payActor( singleDigitalObject[i], amount );
            emit PaidActor( singleDigitalObject[i],  amount ); 
       }
    }

    //====================================================================================================================================
    function payActor ( SingleDigitalObject _singleDigitalObject, uint256 _amount ) public payable virtual override 
    {   
        // TODO: function?
        uint256 i;

        uint256[] memory distribution;
        uint256 num;  
        address[] memory who;
        uint256 perc;

        distribution = _singleDigitalObject.getDistribution();
        perc = PlusMath.percentage( distribution[0], _amount );
        addressToEarnings[_singleDigitalObject.getIeee1599()] = perc;
        payable(_singleDigitalObject.getIeee1599()).transfer(perc);

        // ~~~ Actor ~~~
        num = _singleDigitalObject.getNumActor();

        if ( Compare.nGreaterThenZero( num ) )
        {
            who = _singleDigitalObject.getActor();
            perc = PlusMath.percentage( distribution[1], _amount );

            for ( i = 0; i < num; i++ )
            {
                addressToEarnings[who[i]] = SafeMath.add( addressToEarnings[who[i]], SafeMath.div( perc, num ) );
                payable(who[i]).transfer(SafeMath.div( perc, num ));
            }
        }

        // ~~~ Company ~~~
        num = _singleDigitalObject.getNumCompany();

        if ( Compare.nGreaterThenZero( num ) )
        {
            who = _singleDigitalObject.getCompany();
            perc = PlusMath.percentage( distribution[2], _amount );

            for ( i = 0; i < num; i++ )
            {
                addressToEarnings[who[i]] = SafeMath.add( addressToEarnings[who[i]], SafeMath.div( perc, num ) );
                payable(who[i]).transfer(SafeMath.div( perc, num ));
            }
        }

        // ~~~ Synchronization ~~~
        num = _singleDigitalObject.getNumSynchronization();

        if ( Compare.nGreaterThenZero( num ) )
        {
            who = _singleDigitalObject.getSynchronization();
            perc =  PlusMath.percentage( distribution[3], _amount );

            for ( i = 0; i < num; i++ )
            {
                addressToEarnings[who[i]] = SafeMath.add( addressToEarnings[who[i]], SafeMath.div( perc, num ) );
                payable(who[i]).transfer(SafeMath.div( perc, num ));
            }
        }

    }

}
