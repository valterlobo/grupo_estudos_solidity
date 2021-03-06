# SEMANA 3 - interface, events, required, import, modifier

# 1) import  

Você pode importar arquivos locais e externos no Solidity.

**Local** -  Está a na estrutura de pastas local.

 

**External**

    // https://github.com/owner/repo/blob/branch/path/to/Contract.sol
    import "https://github.com/owner/repo/blob/branch/path/to/Contract.sol";

    // Example import ECDSA.sol from openzeppelin-contract repo, release-v4.5 branch
    // https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.5/contracts/utils/cryptography/ECDSA.sol

    import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.5/contracts/utils/cryptography/ECDSA.sol";



 **Aliases são úteis nos casos:**
 
 - **Evitar colisões de nomes**: nos casos em que o que você deseja importar já foi importado por outros arquivos. Se você encontrar colisões de nomenclatura durante a importação, use aliases para resolver isso.
  
 - **Evitar um comportamento inesperado** (se o compilador não o sinalizou e uma variável que você está usando referencia a variável errada importada de outro lugar).
 
 - **Renomeie o que você está importando**: se quiser usar nomes mais significativos em seu contexto e para clareza de código.



**OpenZeppelin** 

     npm install @openzeppelin/contracts

   Utilizando
 
        pragma solidity ^0.8.0;

        import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
      

        contract MyNFT is ERC721  {
            constructor() ERC721Full("MyNFT", "MNFT") public {
            }
        }


**Base Path and Include Paths**

Recomenda-se definir o caminho base para o diretório raiz do seu projeto e usar os caminhos de inclusão para especificar locais adicionais que podem conter bibliotecas das quais seu projeto depende. Isso permite importar dessas bibliotecas de maneira uniforme, não importa onde elas estejam localizadas no sistema de arquivos em relação ao seu projeto. Por exemplo, se você usa npm para instalar pacotes e seu contrato imports ***@openzeppelin/contracts/utils/Strings.sol***, você pode usar essas opções para informar ao compilador que a biblioteca pode ser encontrada em um dos diretórios de pacotes npm:

    solc contract.sol \
     --base-path . \
     --include-path node_modules/ \
     --include-path /usr/local/lib/node_modules/

***Isto é feito de  forma transparente nas ferramentas de build de contratos.***

 [Fool.sol](Fool.sol)
  
[Import.sol](Import.sol)


ref : [Solidity Tutorial: All About Imports](https://betterprogramming.pub/solidity-tutorial-all-about-imports-c65110e41f3a)


# 2)  library

A libraryem Solidity é um tipo diferente de contrato inteligente que contém código reutilizável. Uma vez implantado no blockchain (apenas uma vez), é atribuído um endereço específico e suas propriedades/métodos podem ser reutilizados muitas vezes por outros contratos na rede Ethereum.
  
  ### Benefícios

- Usabilidade: As funções em uma biblioteca podem ser usadas por muitos contratos. Se você tiver muitos contratos com algum código comum, poderá implantar esse código comum como uma biblioteca.
- Econômico: A implantação de código comum como biblioteca economizará gás, pois o gás também depende do tamanho do contrato. Usar um contrato básico em vez de uma biblioteca para dividir o código comum não economizará gás porque no Solidity, a herança funciona copiando o código.
 - Bons complementos: ***As bibliotecas do Solidity podem ser usadas para adicionar funções de membro a tipos de dados***. Por exemplo, pense em bibliotecas como as bibliotecas padrão ou pacotes que você pode usar em outras linguagens de programação para realizar operações matemáticas complexas em números.

### Restrições
  - Eles não têm nenhum armazenamento (portanto, não podem ter variáveis ​​de estado não constantes)
  - Eles não podem conter éteres (portanto, não podem ter uma função de fallback )
  - Não permite funções a pagar (já que não podem conter éteres)
  - Não pode herdar nem ser herdado
  - Não pode ser destruído (sem selfdestruct()função desde a versão 0.4.20)


## Como instalar  library?
A implantação de biblioteca é um pouco diferente da implantação regular de contrato inteligente. Aqui estão dois cenários:

- Biblioteca incorporada: se um contrato inteligente estiver consumindo uma biblioteca que possui apenas funções internas, o EVM simplesmente incorporará a biblioteca ao contrato. Em vez de usar a chamada de delegado para chamar uma função, ele simplesmente usa a instrução JUMP (chamada de método normal). Não há necessidade de implantar a biblioteca separadamente neste cenário.
  
- Biblioteca Vinculada: Por outro lado, se uma biblioteca contiver funções públicas ou externas , a biblioteca precisará ser implantada. A implantação da biblioteca gerará um endereço exclusivo no blockchain. Este endereço precisa estar vinculado ao contrato de chamada.

[library.sol](library.sol)

REF: [Solidity Tutorial: all about Libraries](https://jeancvllr.medium.com/solidity-tutorial-all-about-libraries-762e5a3692f9)

# 3) interface

  Você pode interagir com outros contratos declarando uma Interface.

- não pode ter nenhuma função implementada
- pode herdar de outras interfaces
- todas as funções declaradas devem ser externas
- não pode declarar um construtor
- não pode declarar variáveis ​​de estado

[interface.sol](interface.sol)

# 4) Herança

Solidity suporta herança múltipla. Os contratos podem herdar outro contrato usando a palavra-chave is.

- A função que será substituída por um contrato filho deve ser declarada como virtual.

- A função que irá substituir uma função pai deve usar a palavra-chave override.

- A ordem de herança é importante.

- Você deve listar os contratos-pai na ordem de “mais básicos” para “mais derivados”.
  
[heranca.sol](heranca.sol)


# 5) Chamando outros  Contratos:

https://solidity-by-example.org/calling-contract


  
# 6) required,assert

      //legado  NAO existe mais 
      function useSuperPowers(){ 
        if (msg.sender != proprietário) { throw; } 
        // fazer algo que somente o dono deve ter permissão para fazer 
    } 

   atualmente se comporta exatamente da mesma forma que todos os itens a seguir:

- if(msg.sender != owner) { revert(); }
- assert(msg.sender == owner);
- require(msg.sender == owner);

Então, se revert() e require() ambos reembolsam qualquer sobra de gás, e permitir que você devolva um valor, por que iria querer queimar gás usando assert() ?
(codido de teste??????)

### Use require()

  ***Use para verificação de erros externos, como entradas inválidas, receber Ether
de outro contrato, etc***

- Valide as entradas do usuário, ou seja.require(input<20);
- Valide a resposta de um contrato externo, ou seja.require(external.send(amount));
- Valide as condições de estado antes da execução, ou seja. require(block.number > SOME_BLOCK_NUMBER) ou require(balance[msg.sender]>=amount)
- Geralmente, você deve usar requirecom mais frequência
- Geralmente, será usado no início de uma função

### Use assert()

***Use para a verificação de erros internos, como índices
inválidos em vetores, divisões por zero, etc.***

- Verifique se há overflow/underflow , ou seja.c = a+b; assert(c > b)
- Verifique invariantes , ou seja. assert(this.balance >= totalSupply);
- Validar o estado depois de fazer alterações
- Prevenir condições que nunca deveriam ser possíveis
- Geralmente, você provavelmente usará assert com menos frequência
- Geralmente, ele será usado no final de uma função.

### Use revert()

   ***geralmente é utilizado com a estrutura if, quando esta não é cumprida a função
revert desfaz a operação e retorna um erro para o remetente.***
- Lide com o mesmo tipo de situações que require(), mas com uma lógica mais complexa.


[RequireExample.sol](RequireExample.sol)

# 7) modifier

O principal caso de uso de modificadores é verificar automaticamente uma condição, antes de executar uma função. Se a função não atender ao requisito do modificador, uma exceção será lançada e a execução da função será interrompida.

      //declarar 
      modifier MyModifier {
          // modifier code .....
      }
 
    //utilizar 
     function name() public MyModifier {
         // function code .....
    }

  [modifier_example.sol](modifier_example.sol)

  [AccessRestriction.sol](AccessRestriction.sol)
  
  ref:

  [Writing Robust Smart Contracts in Solidity](https://blog.colony.io/writing-more-robust-smart-contracts-99ad0a11e948/)
  
  [Solidity Tutorial: all about Modifiers](https://medium.com/coinmonks/solidity-tutorial-all-about-modifiers-a86cf81c14cb)
  

# 8) Eventos

Eventos descrevem as ações que são executadas no contrato. Semelhante às funções, os eventos têm parâmetros que precisam ser especificados quando o evento é chamado.

 Os eventos permitem o registro no blockchain Ethereum. Alguns casos de uso para eventos são:

 - Ouvindo eventos e atualizando a interface do usuário
 - Uma forma barata de armazenamento

Para chamar um evento, você deve usar a palavra-chave emit com o nome do evento e os parâmetros dele.

         contract MyWallet { event DepositEvent(address client, uint value);

              function deposit() public {
                 // ...
                 emit DepositEvent(msg.sender, msg.value);
              }


[events.sol](events.sol)


# 9)  fallback,  address transfer vs send vs call function


**fallback**  é uma função que não recebe argumentos e não retorna nada.

 - É executado tanto quando uma função que não existe é chamada ou Ether é enviado diretamente para um contrato, mas receive() não existe ou msg.data não está vazio 

 - fallback tem um limite de 2300 gás quando chamado por transferência ou envio.

 [fallback.sol](fallback.sol)

 [receive-rther.sol](receive-ether.sol)


**transfer** o contrato inteligente de recebimento deve ter uma função de fallback definida, caso contrário, a chamada de transferência gerará um erro.
 Existe um limite de gás de 2300 gás, o que é suficiente para completar a operação de transferência. Ele é codificado para evitar ataques de reentrada.

     address payable _to ; 

      _to.transfer(msg.value); 


**send** Funciona de forma semelhante à transferência de chamada e tem um limite de gás de 2300 gás também. Ele retorna o status como booleano.

    address payable _to; 

      bool sent =  _to.sent(msg.value); 
      require(sent, "Fail sent value"); 




**call** - É a maneira recomendada de enviar ETH para um contrato inteligente. O argumento vazio aciona a função de fallback do endereço de recebimento.

    address payable _to ; 
    (bool sent,memory data) = _to.call{value: msg.value}("");

 usando call, pode-se também acionar outras funções definidas no contrato e enviar uma quantidade fixa de gás para executar a função. O status da transação é enviado como booleano e o valor de retorno é enviado na variável de dados.


(bool sent, bytes memory data) = _to.call{gas :10000, value: msg.value}("func_signature(uint256 args)");


ref : https://medium.com/coinmonks/solidity-transfer-vs-send-vs-call-function-64c92cfc878a


# PROGRAMANDO


- Desenvolver um contrato carteira compartilhada
- 
   **depositar**  - sender envia um deposito

   **saque**  - sender solicita uma retirada - somente pode realizar a retirada do valor do saldo.

   **adminstrador** - responsavel pelo contrato, somente o administrador pode realizar saque e obter o saldo do total contrato.
