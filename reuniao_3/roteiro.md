# ROTEIRO: 3 - Reunião - interface,  events, required, import,modifier

## 1) import - header  

Você pode importar arquivos locais e externos no Solidity.

**Local** -  Está a na estrutura de pastas local.

  [Fool.sol](https://raw.githubusercontent.com/valterlobo/grupo_estudos_solidity/main/reuniao_3/Fool.sol)
  
  [Import.sol](https://raw.githubusercontent.com/valterlobo/grupo_estudos_solidity/main/reuniao_3/Import.sol)


**External**

    // https://github.com/owner/repo/blob/branch/path/to/Contract.sol
    import "https://github.com/owner/repo/blob/branch/path/to/Contract.sol";

    // Example import ECDSA.sol from openzeppelin-contract repo, release-v4.5 branch
    // https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.5/contracts/utils/cryptography/ECDSA.sol

    import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.5/contracts/utils/cryptography/ECDSA.sol";


**OpenZeppelin** 

     npm install @openzeppelin/contracts

   Utilizando
 
        pragma solidity ^0.5.0;

        import "@openzeppelin/contracts/token/ERC721/ERC721Full.sol";
        import "@openzeppelin/contracts/token/ERC721/ERC721Mintable.sol";

        contract MyNFT is ERC721Full, ERC721Mintable {
            constructor() ERC721Full("MyNFT", "MNFT") public {
            }
        }


## 2)  library

As bibliotecas são semelhantes aos contratos, mas você não pode declarar nenhuma variável de estado e não pode enviar ether.

Uma biblioteca é incorporada ao contrato se todas as funções da biblioteca forem internas.

Caso contrário, a biblioteca deve ser implantada e vinculada antes que o contrato seja implantado.

[library.sol](https://raw.githubusercontent.com/valterlobo/grupo_estudos_solidity/main/reuniao_3/library.sol)


## 3) interface

  Você pode interagir com outros contratos declarando uma Interface.

- não pode ter nenhuma função implementada
- pode herdar de outras interfaces
- todas as funções declaradas devem ser externas
- não pode declarar um construtor
- não pode declarar variáveis ​​de estado

    [interface.sol](https://raw.githubusercontent.com/valterlobo/grupo_estudos_solidity/main/reuniao_3/interface.sol)

## 4) Herança

Solidity suporta herança múltipla. Os contratos podem herdar outro contrato usando a palavra-chave is.

- A função que será substituída por um contrato filho deve ser declarada como virtual.

- A função que irá substituir uma função pai deve usar a palavra-chave override.

- A ordem de herança é importante.

- Você deve listar os contratos-pai na ordem de “mais básicos” para “mais derivados”.
  
[heranca.sol](https://raw.githubusercontent.com/valterlobo/grupo_estudos_solidity/main/reuniao_3/heranca.sol)

  
## 4) required,assert

      //legado  NAO existe mais 
      function useSuperPowers(){ 
        if (msg.sender != proprietário) { throw; } 
        // fazer algo que somente o dono deve ter permissão para fazer 
    } 

   atualmente se comporta exatamente da mesma forma que todos os itens a seguir:

- if(msg.sender != owner) { revert(); }
- assert(msg.sender == owner);
- require(msg.sender == owner);

Então, se revert()e require() ambos reembolsam qualquer sobra de gás, e permitir que você devolva um valor, por que iria querer queimar gás usando assert() ?
(codido de teste??????)

### Use require()

- Valide as entradas do usuário, ou seja.require(input<20);
- Valide a resposta de um contrato externo, ou seja.require(external.send(amount));
- Valide as condições de estado antes da execução, ou seja. require(block.number > SOME_BLOCK_NUMBER) ou require(balance[msg.sender]>=amount)
- Geralmente, você deve usar requirecom mais frequência
- Geralmente, será usado no início de uma função

### Use assert()

- Verifique se há overflow/underflow , ou seja.c = a+b; assert(c > b)
- Verifique invariantes , ou seja. assert(this.balance >= totalSupply);
- Validar o estado depois de fazer alterações
- Prevenir condições que nunca deveriam ser possíveis
- Geralmente, você provavelmente usará assertcom menos frequência
- Geralmente, ele será usado no final de uma função.

### Use revert()

- Lide com o mesmo tipo de situações que require(), mas com uma lógica mais complexa.


   [RequireExample.sol](https://raw.githubusercontent.com/valterlobo/grupo_estudos_solidity/main/reuniao_3/RequireExample.sol)

## 5) modifier

O principal caso de uso de modificadores é verificar automaticamente uma condição, antes de executar uma função. Se a função não atender ao requisito do modificador, uma exceção será lançada e a execução da função será interrompida.

      //declarar 
      modifier MyModifier {
          // modifier code .....
      }
 
    //utilizar 
     function name() public MyModifier {
         // function code .....
    }

  [modifier_example.sol](https://raw.githubusercontent.com/valterlobo/grupo_estudos_solidity/main/reuniao_3/modifier_example.sol)

  [AccessRestriction.sol](https://raw.githubusercontent.com/valterlobo/grupo_estudos_solidity/main/reuniao_3/AccessRestriction.sol)
  
  ref:

  [Writing Robust Smart Contracts in Solidity](https://blog.colony.io/writing-more-robust-smart-contracts-99ad0a11e948/)

  [Solidity Tutorial: all about Modifiers](https://medium.com/coinmonks/solidity-tutorial-all-about-modifiers-a86cf81c14cb)

## 6) Eventos 
 Os eventos permitem o registro no blockchain Ethereum. Alguns casos de uso para eventos são:

 - Ouvindo eventos e atualizando a interface do usuário 
 - Uma forma barata de armazenamento

  [events.sol](https://raw.githubusercontent.com/valterlobo/grupo_estudos_solidity/main/reuniao_3/events.sol)

```

[Cheat-Sheet solidity](https://intellipaat.com/mediaFiles/2019/03/Solidity-Cheat-Sheet.pdf)