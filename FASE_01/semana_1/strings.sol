// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract ComparaString {
     string public s; 

    function set_s(string memory _s)  public 
    {
    
         s= _s; 

    } 

    function compara(string memory _p) view public returns(bool)
    {
    
         return (keccak256(abi.encodePacked((s))) == keccak256(abi.encodePacked((_p))));

    } 
}