// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Variables {
    // As variáveis de estado são armazenadas no blockchain.
    string public text = "Hello World";
    uint256 public num = 123;

    function doSomething() public {
        // Variáveis locais não são salvas no blockchain.
        uint256 i = 456;

        // Aqui estão algumas variáveis globais
        uint256 timestamp = block.timestamp; // timestamp do bloco atual
        address sender = msg.sender; //endereço do "SENDER" 
    }
}
