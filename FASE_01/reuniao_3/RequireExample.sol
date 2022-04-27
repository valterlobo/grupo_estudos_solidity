// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract ExceptionExample {
    mapping(address => uint256) public balanceReceived;

    function receiveMoney() public payable {
        balanceReceived[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable _to, uint256 _amount) public {
        
        if (_amount <= balanceReceived[msg.sender]) {
            balanceReceived[msg.sender] -= _amount;
            _to.transfer(_amount);
        }

        /* require(_amount <= balanceReceived[msg.sender], "Not Enough Funds, aborting");

        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);*/
    }
}
