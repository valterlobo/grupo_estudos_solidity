# ROTEIRO: 4 - Reunião - transaction, gas , remix debug , selft destruct , ABI , address 


## 1) ddddddd

   -  endereços de contrato e conta, estado  ????? 


## ABI

arrquivo no formato JSON 
informaç~oes para interagir com o contrato

## Using library  for type


## fallback,  address transfer vs send vs call function


**fallback**  é uma função que não recebe argumentos e não retorna nada.

 - É executado tanto quando uma função que não existe é chamada ou Ether é enviado diretamente para um contrato, mas receive() não existe ou msg.data não está vazio 

 - fallback tem um limite de 2300 gás quando chamado por transferência ou envio.

 [fallback.sol](https://raw.githubusercontent.com/valterlobo/grupo_estudos_solidity/main/reuniao_4/fallback.sol)

 [receive-rther.sol](https://raw.githubusercontent.com/valterlobo/grupo_estudos_solidity/main/reuniao_4/receive-ether.sol)


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


## Chamando outros  Contratos: 
https://solidity-by-example.org/calling-contract

Solidity Grátis
https://solidity.coflow.com.br/blog/guia-solidity/


[Cheat-Sheet solidity](https://intellipaat.com/mediaFiles/2019/03/Solidity-Cheat-Sheet.pdf)
