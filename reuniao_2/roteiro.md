# ROTEIRO : 2 - Reunião -  Solidity mapping , array , if, for, while,  function. 


- ## 1)Etherum como funciona(máquina de estado) - PARTE 2 

   -  enderços de contrato e conta, estado

    https://txstreet.com/v/eth-btc


- ## 2) mapping
     - Os mapas são criados com o mapeamento de sintaxe (keyType => valueType).

     - O keyType pode ser qualquer tipo de valor interno, bytes, string ou qualquer contrato.
     
     valueType pode ser qualquer tipo, incluindo outro mapeamento ou uma matriz.
     
     - Os mapeamentos não são iteráveis.

​                  [mapping.sol](https://raw.githubusercontent.com/valterlobo/grupo_estudos_solidity/main/reuniao_2/mapping.sol)


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
    
         - As funções getter podem ser declaradas como view ou puras.
        
         -  A função View declara que nenhum estado será alterado.
        
         - A função pura declara que nenhuma variável de estado será alterada ou lida.
    
    
      
    
      
    
    [immutable.sol](https://raw.githubusercontent.com/valterlobo/grupo_estudos_solidity/main/reuniao_1/immutable.sol)

---------
[Cheat-Sheet solidity](https://intellipaat.com/mediaFiles/2019/03/Solidity-Cheat-Sheet.pdf)
