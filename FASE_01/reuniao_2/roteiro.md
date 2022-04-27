# ROTEIRO : 2 - Reunião -  Solidity mapping , array , if, for, while,  function.


 ## 1) Como trabalhar com ponto flutuante com solidity

   -  solididty - tipos ponto flutuante/decimal/float
  Ref: 
      [Matemática em Solidity (Parte 1: Números)](https://www.web3dev.com.br/yanluiz/matematica-em-solidity-parte-1-numeros-4jb2)
     [Matemática em Solidity (Parte 2: Overflow)](https://www.web3dev.com.br/yanluiz/matematica-em-solidity-parte-2-overflow-53p6)
     [Matemática em Solidity (Parte 3: Porcentagens e Proporções)](https://www.web3dev.com.br/yanluiz/matematica-em-solidity-parte-3-porcentagens-e-proporcoes-3g83)
    [Matemática em Solidity (Parte 4: Juros Compostos)](https://www.web3dev.com.br/yanluiz/matematica-em-solidity-parte-4-juros-compostos-4b7k)
    [Matemática em Solidity (Parte 5: Expoente e Logaritmo)](https://www.web3dev.com.br/yanluiz/matematica-em-solidity-parte-5-expoente-e-logaritmo-25l5)



   

 ## 2) Mapping
 
   - Os mapas são criados com o mapeamento de sintaxe (keyType => valueType).

   - O keyType pode ser qualquer tipo de valor interno, bytes, string ou qualquer contrato.
     
     valueType pode ser qualquer tipo, incluindo outro mapeamento ou uma matriz.
     
   - Os mapeamentos não são iteráveis.
     
     [mapping.sol](https://raw.githubusercontent.com/valterlobo/grupo_estudos_solidity/main/reuniao_2/mapping.sol)


 ## 3) Array 

   - O array pode ter um tamanho fixo em tempo de compilação ou um tamanho dinâmico.
  
  [array.sol](https://raw.githubusercontent.com/valterlobo/grupo_estudos_solidity/main/reuniao_2/array.sol)
    
## 4) Condicional if  
  
  [ifelse.sol](https://raw.githubusercontent.com/valterlobo/grupo_estudos_solidity/main/reuniao_2/ifelse.sol)
  
## 5) Loop : for, while:

   - Solidity suporta loops for, while e do while.

   - Não escreva loops ilimitados, pois isso pode atingir o limite de gás, fazendo com que sua transação falhe.
   
   - Os loops while e do while raramente são usados.
   
   [loop.sol](https://raw.githubusercontent.com/valterlobo/grupo_estudos_solidity/main/reuniao_2/loop.sol)


## 6) Funções:

   - Existem várias maneiras de retornar saídas de uma função. As funções públicas não podem aceitar certos tipos de dados como entradas ou saídas.
    
    - O corpo de uma função.
    
      ​     `function funcao( param1 tipo, param2 tipo ) return (uint) {`
    
      ​                           `return param1 + param2;`
    
      ​     `}`
      
   - O escopo das variáveis de estado e funções é controlado pelas seguintes palavras-chave possíveis:
    
     • **public**    - Todos podem acessar
    
     • **external** - Não pode ser acessado internamente, apenas externamente. De funções internas, deve ser chamado com isto-->func_name()
    
     • **internal**  - somente este contrato e os contratos derivados dele podem acessá-lo
    
     • **private**   - pode ser acessado apenas a partir deste contrato, contratos herdados de outro não podem acessá-lo
    

  Como você pode notar, private  é um subconjunto de internal e external é um subconjunto de public. Ao definir uma função, você tem a seguinte sintaxe:

            function nome_function(type1 var1, ...) [public,external,private,internal]  [payable|pure|view] [returns (type var, type var ....)] { ... }

  - Pure, view, payable
    -  **view**: A função NÃO alterará o armazenamento do contrato
    -  **pure**: A função NÃO  LER as variáveis de armazenamento do contrato (é uma função auxiliar, por exemplo soma dois valores e retorna o resultado)
    - **payable**: A função pode enviar e receber Ethers.
  
   **view** pode ser considerado como o subconjunto de constantes que lerá o armazenamento (portanto, visualização). No entanto, o armazenamento não será modificado. Se você usar essas funções, não pagará **gas** por isso, mas o EVM pode impedi-lo se suas consultas ficarem muito longas.
  
                     contract viewExample {
      
                        string state;
                        // other contract functions
                        function viewState() public view returns(string) {
                            //read the contract storage 
                            return state;
                        }
                    }


  **pure** pode ser considerado como o subconjunto de constante em que o valor de retorno será determinado apenas por seus parâmetros (valores de entrada). Não haverá leitura ou gravação no armazenamento e apenas a variável local será usada (tem o conceito de funções puras na programação funcional).
  
                   contract pureExample {
                        // other contract functions
                        function pureComputation(uint para1 , uint para2) public pure returns(uint result) {
                            // do whatever with para1 and para2 and assign to result as below
                            result = para1 + para2;
                            return  result;
                        }

  
  **payable** - Ao escrever um contrato inteligente, você precisa garantir que o dinheiro seja enviado para o contrato e também para fora do contrato. Payable faz isso para você, qualquer função no Solidity com o modificador Payable garante que a função possa enviar e receber Ether. 
  obs : transações com valor zero sao rejeitadas.
    
    
                       contract payableExample {
                        //payable obs : error public ?????
                        function receive() payable {}
                        
                        function balanace() public view returns (uint amount) {
                              return address(this).balance;
                                   
                        }




   [function.sol](https://raw.githubusercontent.com/valterlobo/grupo_estudos_solidity/main/reuniao_2/function.sol)
   
   [payable.sol](https://raw.githubusercontent.com/valterlobo/grupo_estudos_solidity/main/reuniao_2/payable.sol)

## 7) Storage, Memory and Calldata

As variáveis são declaradas como **storage**, **memory** ou **calldata** para especificar explicitamente a localização dos dados.

 - storage - é uma variável de estado (armazenada no blockchain)
 - memory - a variável está na memória e existe enquanto uma função está sendo chamada
 - calldata - localização de dados especial que contém argumentos de função

 [datalocations.sol](https://raw.githubusercontent.com/valterlobo/grupo_estudos_solidity/main/reuniao_2/datalocations.sol)
 

## 8) struct

Você pode definir seu próprio tipo criando um struct.
Eles são úteis para agrupar dados relacionados.
Os structs podem ser declarados fora de um contrato e importados em outro contrato.

 [structs.sol](https://raw.githubusercontent.com/valterlobo/grupo_estudos_solidity/main/reuniao_2/structs.sol)
 

  
   ## Dever de casa 
  
   ### a) É possível alterar uma variável pública do contrato por chamada externa?

   ### b) Problema de "out of gas" em funções que possuem o tipo "delete":

```
        contract Mapping {
         mapping(address => uint256) public myMap;
         [...]
         function remove(address _addr) public {
                 // Redefina o valor para o valor padrão.
                 delete myMap[_addr];
             }
                      }`
```


 ### c) Storage x Memory - quais as principais diferenças entre os dois? Como usá-los de forma mais efetiva dentro de um contrato.
 
 - **Data Location in Solidity Explained** -> https://blockheroes.dev/data-location-in-solidity/
 
      
 

 ### d) Por que os arrays devem ter memory no retorno das funções?

```
         contract Array {
             uint256[] public arr;
             [...]
             function getArr() public view returns (uint256[] memory) {
                 return arr;
             }

```

 ### e) Realizar testes passagem por referencia x valor ?


  funcao que altera um o valor de um int e outra que alterar o valor de um array de int.

