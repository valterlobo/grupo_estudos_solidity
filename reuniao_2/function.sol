// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Function {
    // As funções podem retornar vários valores.
    function returnMany()
        public
        pure
        returns (
            uint256,
            bool,
            uint256
        )
    {
        return (1, true, 2);
    }

    // Os valores de retorno podem ser nomeados.
    function named()
        public
        pure
        returns (
            uint256 x,
            bool b,
            uint256 y
        )
    {
        return (1, true, 2);
    }
     // Valores de retorno podem ser atribuídos ao seu nome.
     // Neste caso, a instrução return pode ser omitida.
    function assigned()
        public
        pure
        returns (
            uint256 x,
            bool b,
            uint256 y
        )
    {
        x = 1;
        b = true;
        y = 2;
    }

     // Usa atribuição de  nao estruturado ao chamar outro
     // função que retorna vários valores.
    function destructuringAssignments()
        public
        pure
        returns (
            uint256,
            bool,
            uint256,
            uint256,
            uint256
        )
    {
        (uint256 i, bool b, uint256 j) = returnMany();

        (uint256 x, , uint256 y) = (4, 5, 6);

        return (i, b, j, x, y);
    }

      // Não é possível usar o mapping para entrada ou saída
     // Pode usar array para entrada
    function arrayInput(uint256[] memory _arr) public {}


   // Pode usar array para saída
    uint256[] public arr;

    function arrayOutput() public view returns (uint256[] memory) {
        return arr;
    }


     //public view
    function externalOutput()  public view    returns (uint256[] memory) {
        return arr;
    }

    function externalLength() public view  returns (uint256) {
         uint256[] memory  arr2 = externalOutput();
        return arr2.length;
    }

    function externalLength2() private view  returns (uint256) {
        
        return arr.length;
    }

    string state;
    function viewState() public view returns(string  memory) {
                      //leitura da variavel armazenada no contrato 

                      return state;
    }

           // other contract functions
                        function pureComputation(uint para1 , uint para2) public pure returns(uint result) {
                           
                            result = para1 + para2;
                            return  result;
                        }




}
