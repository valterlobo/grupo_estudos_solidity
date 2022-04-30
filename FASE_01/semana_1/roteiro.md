# SEMANA 1 - Etherum maquina virtual-variáveis e operações em solidity

O Solidity tem tipo estático, o que significa que a verificação de tipo ocorre em tempo de compilação, não em tempo de execução, como em linguagens com tipo dinâmico. Com uma linguagem de tipo estático, você precisa especificar o tipo de cada variável. Por exemplo, Python e JavaScript são linguagens de tipo dinâmico, enquanto C++ tem tipo estático.

O Solidity dá suporte à herança, o que significa que as funções, variáveis e outras propriedades presentes em um contrato podem ser usadas em outra. A linguagem também dá suporte a tipos complexos definidos pelo usuário, como structs e enums, que permitem agrupar tipos de dados relacionados.


## 1) Maquina virtual do Ethereum

Os contratos do Solidity são executados na EVM, a máquina virtual do Ethereum. É um ambiente de área restrita completamente isolado. Ele não acessa nada mais na rede além dos contratos que executa.


   #### LINK PARA UMA APRESENTAÇAO
    https://txstreet.com/v/eth-btc
    

## 2) Primeiro contrato


Todos os contratos do Solidity normalmente incluem:

* Diretivas pragma   - palavra-chave que você usa para solicitar que o compilador verifique se sua versão do Solidity corresponde à necessária. 
     
      pragma solidity ^0.8.10;

* Os arquivos de origem do contrato sempre começam com a definição ***contract ContractName***.
      
         contract MarketToken { uint price_token; // State variable


* Variáveis de estado - As variáveis de estado são fundamentais para qualquer arquivo de origem do Solidity. Os valores da variável de estado são armazenados permanentemente no armazenamento de contratos.
  
       contract Counter {
         uint256 public count;

  ***public:*** parte da interface do contrato e pode ser acessada de outros contratos.

  ***internal:***  acessada somente dentro do contrato atual.

  ***private:*** visível apenas para o contrato em que está definida.
      
    

* Funções - Em um contrato, as unidades de código executáveis são conhecidas como funções. As funções descrevem uma única ação para obter uma tarefa. Elas são reutilizáveis e também podem ser chamadas de outros arquivos de origem, como bibliotecas.
          
               // O corpo de uma função.
          function funcao( param1 tipo, param2 tipo ) return (uint) {
       ​                           return param1 + param2;
          }


* Eventos  - Eventos descrevem as ações que são executadas no contrato. Semelhante às funções, os eventos têm parâmetros que precisam ser especificados quando o evento é chamado.
  
  

   [counter.sol](counter.sol)

## 3) Variáveis

   Existem 3 tipos de variáveis no Solidity
     **LOCAL** - declarado dentro de uma função, não armazenado no blockchain
     **ESTADO** - declarado fora de uma função, armazenado na blockchain
     **GLOBAL** - fornece informações sobre o blockchain
    
   [variables.sol](variables.sol)

## 4) Tipos de dados   primitivos
    
   - boolean
   - uint
   - int
   - address
   
   [primitives.sol](primitives.sol)


## 5) Constantes:

Constantes são variáveis que não podem ser modificadas.
O uso constante pode economizar custos de gás.

   [constants.sol](constants.sol)

## 6) Variável  Imutável:

Variáveis imutáveis são como constantes. Valores de variáveis imutáveis podem ser definidos dentro do construtor, mas não podem ser modificados posteriormente.

[immutable.sol](immutable.sol)

## Operadores


--------- 
[Cheat-Sheet solidity](https://intellipaat.com/mediaFiles/2019/03/Solidity-Cheat-Sheet.pdf)


Solidity Grátis
https://solidity.coflow.com.br/blog/guia-solidity/


REF :
https://docs.soliditylang.org/en/v0.8.13/


# PROGRAMANDO
 - 1) Aprender sobre blockchain básico, EVM - máquina de estado.
 - 2) Criar alguns contratos simples no remix - tipos básicos.
 - 3) Descobrir porque a solidity  não tem número decimal. 
  
     

