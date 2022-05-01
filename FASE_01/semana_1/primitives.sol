// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Primitives {
    bool public boo = true;

    /*
     uint significa inteiro sem sinal, ou seja, inteiros não negativos
     tamanhos diferentes estão disponíveis
         uint8 varia de 0 a 2 ** 8 - 1
         uint16 varia de 0 a 2 ** 16 - 1
         ...
         uint256 varia de 0 a 2 ** 256 - 1
     */
    uint8 public u8 = 1;
    uint256 public u256 = 456;
    uint256 public u = 123; // uint é um alias para uint256

    /*
     Números negativos são permitidos para tipos int.
     Como uint, diferentes intervalos estão disponíveis de int8 a int256
    
     int256 varia de -2 ** 255 a 2 ** 255 - 1
     int128 varia de -2 ** 127 a 2 ** 127 - 1
     */
    int8 public i8 = -1;
    int256 public i256 = 456;
    int256 public i = -123; // int is same as int256

    // min e max de int
    int256 public minInt = type(int256).min;
    int256 public maxInt = type(int256).max;

    address public addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;

    /*
     No Solidity, o tipo de dado byte representa uma sequência de bytes.
     Solidity apresenta dois tipos de bytes:

      - matrizes de bytes de tamanho fixo
      - matrizes de bytes dimensionadas dinamicamente.
     
      O termo bytes no Solidity representa uma matriz dinâmica de bytes.
      É um atalho para byte[] .
    */
    bytes1 a = 0xb5; //  [10110101]
    bytes1 b = 0x56; //  [01010110]

    bytes c =new bytes(0);

    uint256  sizeC =  c.length;
    
    // Valores padrão
    // Variáveis não atribuídas têm um valor padrão
    bool public defaultBoo; // false
    uint256 public defaultUint; // 0
    int256 public defaultInt; // 0
    address public defaultAddr; // 0x0000000000000000000000000000000000000000
    string shipped = "shipped"; // shipped



    function overflowTest() public {
        i8 = 126;
        i8 =i8 + 10;  
    }

}
