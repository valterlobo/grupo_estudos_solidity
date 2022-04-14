# ROTEIRO : 2 - Reunião -  Solidity mapping , array , if, for, while,  function. 


- ## 1)Etherum como funciona(máquina de estado) - PARTE 2 

   -  enderços de contrato e conta, estado

    ****
    https://txstreet.com/v/eth-btc


- ## 2) mapping
     - Os mapas são criados com o mapeamento de sintaxe (keyType => valueType).

     - O keyType pode ser qualquer tipo de valor interno, bytes, string ou qualquer contrato.
     
     valueType pode ser qualquer tipo, incluindo outro mapeamento ou uma matriz.
     
     - Os mapeamentos não são iteráveis.
     
     [mapping.sol](https://raw.githubusercontent.com/valterlobo/grupo_estudos_solidity/main/reuniao_2/mapping.sol)


- ## 3) array 

    - O array pode ter um tamanho fixo em tempo de compilação ou um tamanho dinâmico.

    [ array.sol](https://raw.githubusercontent.com/valterlobo/grupo_estudos_solidity/main/reuniao_2/array.sol)

- ## 4) Condicional if  
  
  [ifelse.sol](https://raw.githubusercontent.com/valterlobo/grupo_estudos_solidity/main/reuniao_2/ifelse.sol)
    
- ## 5) loop : for, while:

   - Solidity suporta loops for, while e do while.

   - Não escreva loops ilimitados, pois isso pode atingir o limite de gás, fazendo com que sua transação falhe.
   
   - Os loops while e do while raramente são usados.
   
   [loop.sol](https://raw.githubusercontent.com/valterlobo/grupo_estudos_solidity/main/reuniao_2/loop.sol)


- ## 6) funções:

    - Existem várias maneiras de retornar saídas de uma função. As funções públicas não podem aceitar certos tipos de dados como entradas ou saídas.
    
    - O corpo de uma função.
    
      ​     `function funcao( param1 tipo, param2 tipo ) return (uint) {`
    
      ​                           `return param1 + param2;`  
    
      ​     `}`
      
    - O escopo das variáveis de estado e funções é controlado pelas seguintes palavras-chave possíveis:
    
     • **public**    - Todos podem acessar
     • ** external** - Não pode ser acessado internamente, apenas externamente. De funções internas, deve ser chamado com isto-->func_name()
     • **internal**  - somente este contrato e os contratos derivados dele podem acessá-lo
     • **private**   - pode ser acessado apenas a partir deste contrato, contratos herdados de outro não podem acessá-lo

      Como você pode notar, private  é um subconjunto de internal e external é um subconjunto de public. Ao definir uma função, você tem a seguinte sintaxe:

            function nome_function(type1 var1, ...) public [payable|pure|view] [returns (type var)] { ... }

  - Pure, view, payable
    -  view: A função NÃO alterará o armazenamento do contrato
    -  pure: A função NÃO  LER as variáveis de armazenamento do contrato (é uma função auxiliar, por exemplo soma dois valores e retorna o resultado)
    - payable: A função pode enviar e receber Ethers.
   
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
                        }`
    
    [function.sol](https://raw.githubusercontent.com/valterlobo/grupo_estudos_solidity/main/reuniao_2/function.sol)

---------
[Cheat-Sheet solidity](https://intellipaat.com/mediaFiles/2019/03/Solidity-Cheat-Sheet.pdf)
