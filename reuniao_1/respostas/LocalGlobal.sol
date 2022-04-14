// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

//Neste exercício você deverá declarar uma variavel global
//criar uma função que some um valor com essa variável
//Criar outra função que altere a variavel global;

contract LocalAndGlobal {
    uint public global = 100;
    uint public sum;
    uint public total;

    function addLocal(uint _global) public returns(uint) {
        global = _global;
        sum = 101 + global;
        return sum;
    }

    function addGlobal() public returns(uint) {
        total = 1001 + global;
        return total;
    }
}