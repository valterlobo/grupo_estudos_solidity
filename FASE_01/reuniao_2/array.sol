// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Array {
    // initializar array
    uint256[] public arr;
    uint256[] public arr2 = [1, 2, 3];
    // Tamanaho fixo todos os elementos inicia com  0
    uint256[10] public myFixedSizeArr;

    function get(uint256 i) public view returns (uint256) {
        return arr[i];
    }

    // Solidity pode retornar o array inteiro.
    // Mas esta função deve ser evitada para
    // arrays que podem crescer indefinidamente em tamanho.
    function getArr() public view returns (uint256[] memory) {
        return arr;
    }

    function push(uint256 i) public {
        //Anexa ao array
        // Isso aumentará o comprimento do array em 1.
        arr.push(i);
    }

    function pop() public {
        //Remove o último elemento do array
        //Isso diminuirá o comprimento do array em 1
        arr.pop();
    }

    function getLength() public view returns (uint256) {
        return arr.length;
    }

    function remove(uint256 index) public {
        // Excluir não altera o tamanho do array.
        // Ele redefine o valor no índice para seu valor padrão,
        // neste caso
        delete arr[index];
    }

    function examples() public pure returns (uint256) {
        // cria array na memória, somente tamanho fixo pode ser criado
        uint256[] memory a = new uint256[](5);
        return a.length;
    }
}
