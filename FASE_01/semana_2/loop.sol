// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Loop {
    function loopFor(uint256 idx) public pure returns (uint256) {
        uint256 result;
        // for loop
        for (uint256 i = 0; i < idx; i++) {
            if (i == 3) {
                result = i;
                // Skip to next iteration with continue
                continue;
            }
            if (i == 5) {
                result = i;
                // Exit loop with break
                break;
            }
        }

        return result;
    }

    function loopWhile(uint256 idx) public pure returns (uint256) {
        uint256 result;
        // while loop
        uint256 j;
        while (j < idx) {
            j++;
            result = result + j + 1;
        }

        return result;
    }
}
