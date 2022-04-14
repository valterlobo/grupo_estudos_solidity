// SPDX-License-Identifier: MIT

//Calcular o tempo de um movimento retilineo uniforme,
//dada uma distancia e uma velocidade

pragma solidity ^0.8.10;

contract physicsTime {
    uint public distance;
    uint public speed;
    uint public time;

    function getDistance(uint _distance) public {
        distance = _distance;
    }

    function getSpeed(uint _speed) public {
        speed = _speed;
    }

    function calculateTime() public {
        time = distance / speed;
    }

}