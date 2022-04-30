// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract IfElse {

    function foo(uint256 x) public pure returns (uint256) {
    
        if (x < 10) {
            return 0;
        } else if (x < 20) {
            return 1;
        } else {
            return 2;
        }
    }

    function ternary(uint256 _x) public pure returns (uint256) {
        // if (_x < 10) {
        //     return 1;
        // }
        // return 2;

        // short way to write if / else statement
        return _x < 10 ? 1 : 2;
    }
}
