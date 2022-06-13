// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../interfaces/SingleDigitalObject_Interface.sol";

import "../security/Ownable.sol";
import "../security/Pausable.sol";

import "../utils/array/Arrays_Interface.sol";
import "../utils/Context.sol";


contract SingleDigitalObject is ISingleDigitalObject, 
                                Context, 
                                Ownable,
                                Pausable, 
                                IArrays
{
    address    private ieee1599; 
    address [] private actor; 
    address [] private company;
    address [] private synchronization;

    string    private name;
    string    private symbol;
    uint256   private age;
    typeT     private typeOf;
    uint256   private price;
    uint256[] private distribution = [10,  // % ieee1599
                                      40,  // % actors
                                      40,  // % companies
                                      10]; // % synchronization
     
    constructor ( 
        string memory _name, 
        string memory _symbol, 
        uint256       _age, 
        typeT         _typeOf, 
        uint256       _price
        )
    {
        ieee1599 = payable(_msgSender());
        name   = _name;
        symbol = _symbol;
        age    = _age;
        typeOf = _typeOf;
        price  = _price;
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

    function getAge () public view virtual override 
                       whenNotPaused() 
                       returns ( uint256 ) 
    {
        return age;
    }

    function getType () public view virtual override 
                        whenNotPaused() 
                        returns ( typeT ) 
    {
        return typeOf;
    }

    function getPrice () public view virtual override 
                         whenNotPaused() 
                         returns ( uint256 ) 
    {
        return price;
    }

    function getIeee1599 () public view virtual override 
                            whenNotPaused() 
                            returns ( address ) 
    {
        return ieee1599;
    }

    function getActor () public view virtual override  
                         whenNotPaused() 
                         returns ( address[] memory ) 
    {
        return actor;
    }
    
    function getCompany () public view virtual override 
                           whenNotPaused() 
                           returns ( address[] memory ) 
    {
        return company;
    }

    function getSynchronization () public view virtual override 
                                   whenNotPaused() 
                                   returns ( address[] memory ) 
    {
        return synchronization;
    }

    function getNumActor () public view virtual override 
                            whenNotPaused() 
                            returns ( uint256 ) 
    {
        return actor.length;
    }

    function getNumCompany () public view virtual override 
                              whenNotPaused() 
                              returns ( uint256 ) 
    {
        return company.length;
    }
    
    function getNumSynchronization () public view virtual override 
                                      whenNotPaused() 
                                      returns ( uint256 )
    {
        return synchronization.length;
    }

    function getDistribution () public view virtual override 
                                whenNotPaused() 
                                returns ( uint256[] memory ) 
    {
        return distribution;
    }

    // ================================ SET ================================
    function setName ( string memory _name ) public virtual override 
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
    
    function setAge ( uint256 _age )  public virtual override 
                                      onlyOwner() 
                                      whenNotPaused() 
    {
        age = _age;
    }
    
    function setType ( typeT _typeOf ) public virtual override 
                                       onlyOwner() 
                                       whenNotPaused() 
    {
        typeOf = _typeOf;
    }
     
    function setPrice ( uint256 _price ) public virtual override 
                                         onlyOwner() 
                                         whenNotPaused() 
    {
        price = _price;
    }
    
    function setActor ( address[] memory _actor ) public virtual  override 
                                                  onlyOwner() 
                                                  whenNotPaused() 
                                                  AddressGreaterThenZero( _actor )
    {
        
        for (uint256 i = 0; i < _actor.length; i++)
        {
            assert( !( Arrays.elementSearch( actor, _actor[i] ) ) );
            actor.push(  _actor[i]);    
        }
        
    }   
    
    function setCompany ( address[] memory _company ) public virtual override 
                                                      onlyOwner() 
                                                      whenNotPaused() 
                                                      AddressGreaterThenZero( _company )
    {
       for (uint256 i = 0; i < _company.length; i++)
       {
            assert( !( Arrays.elementSearch( company, _company[i] ) ) );
            company.push( _company[i] );
       }
    }
    
    function setSynchronization ( address[] memory _synchronization ) public virtual override 
                                                                      onlyOwner() 
                                                                      whenNotPaused() 
                                                                      AddressGreaterThenZero( _synchronization )
    {
        for (uint256 i = 0; i < _synchronization.length; i++)
        {
            assert( !( Arrays.elementSearch( synchronization, _synchronization[i] ) ) );
            synchronization.push(_synchronization[i]);
        }
    }
     
    function setDistribution ( uint256[] memory _distribution ) public virtual override 
                                                                onlyOwner() 
                                                                whenNotPaused() 
                                                                UintGreaterThenZero( _distribution ) 
    {
       for ( uint256 i = 0; i < _distribution.length; i++ )
       {
          distribution[i] = _distribution[i];
       }
    }

     
}