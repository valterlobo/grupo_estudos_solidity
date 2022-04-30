// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract DataLocations {

    uint[] public arr;

    mapping(uint => address) map;
    struct MyStruct {
        uint foo;
    }
    mapping(uint => MyStruct) myStructs;

    function f() public {
        // call _f with state variables
        _f(arr, map, myStructs[1]);

        // get a struct from a mapping
        MyStruct storage myStruct = myStructs[1];
        // struct in memory
        MyStruct memory myMemStruct = MyStruct(0);
    }

    function _f(
        uint[] storage _arr,
        mapping(uint => address) storage _map,
        MyStruct storage _myStruct
    ) internal {
       
    }


    function g(uint[] memory _arr) public returns (uint[] memory) {
      
    }

    function h(uint[] calldata _arr) external {
        // do something with calldata array
    }
}

