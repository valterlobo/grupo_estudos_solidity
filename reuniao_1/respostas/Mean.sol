// SPDX-License-Identifier: MIT

//Neste exercício você deverá retornar a média de três números inteiros informados
//pelo usuário

pragma solidity ^0.8.10;

contract Mean {
    uint public a;

    function mean(uint _num1, uint _num2, uint _num3) public returns(uint) {
        a = (_num1 + _num2 + _num3) / 3;
        return a;
    }
}