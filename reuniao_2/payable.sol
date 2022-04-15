// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Payable {
    // Endereço a pagar pode receber Ether
    address payable public owner;

    // Construtor  payable pode receber Ether
    constructor() payable {
        owner = payable(msg.sender);
    }

    // Função para depositar Ether neste contrato.
    // Chama esta função junto com algum Ether.
    // O saldo deste contrato será atualizado automaticamente.
    function deposit() public payable {}

    // Chama esta função junto com algum Ether.
    // A função lançará um erro, pois esta função não é pagável.
    function notPayable() public {}

    //Função para retirar todo o Ether deste contrato.
    function withdraw() public {
        uint256 amount = address(this).balance;

        // envia todo o Ether para o dono
        // Proprietário pode receber Ether desde que o endereço do proprietário seja pagável
        (bool success, ) = owner.call{value: amount}("");
        require(success, "Failed to send Ether");
    }

    // Função para transferir Ether deste contrato para o endereço da entrada
    function transfer(address payable _to, uint256 _amount) public {
        // Note that "to" is declared as payable
        (bool success, ) = _to.call{value: _amount}("");
        require(success, "Failed to send Ether");
    }
}
