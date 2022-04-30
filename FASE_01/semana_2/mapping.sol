// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Mapping {
    // Mapping from address to uint
    mapping(address => uint256) public myMap;

    function get(address _addr) public view returns (uint256) {
        // Mapping  sempre retorna um valor.
        // Se o valor nunca foi definido, ele retornará o valor padrão.

        return myMap[_addr];
    }

    function set(address _addr, uint256 _i) public {
        //alterar o valor 
        myMap[_addr] = _i;
    }

    function remove(address _addr) public {
        // Redefina o valor para o valor padrão.
        delete myMap[_addr];
    }
}

contract NestedMapping {
    
    // Mapeamento aninhado (mapeamento do endereço para outro mapeamento)
    mapping(address => mapping(uint256 => bool)) public nested;

    function get(address _addr1, uint256 _i) public view returns (bool) {

        return nested[_addr1][_i];
    }

    function set(
        address _addr1,
        uint256 _i,
        bool _boo
    ) public {
        nested[_addr1][_i] = _boo;
    }

    function remove(address _addr1, uint256 _i) public {
        delete nested[_addr1][_i];
    }
}
