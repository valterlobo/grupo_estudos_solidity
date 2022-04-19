// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Event {
    //Eevento
    // Até 3 parâmetros podem ser indexados.
    // Parâmetros indexados ajudam a filtrar os logs pelo parâmetro indexado

    event Log(address indexed sender, string message);
    event AnotherLog();

    function testEvent() public {
        emit Log(msg.sender, "Hello World!");
        emit Log(msg.sender, "Hello EVM!");
        emit AnotherLog();
    }
}
