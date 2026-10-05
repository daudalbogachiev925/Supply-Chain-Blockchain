// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SupplyChain {
    struct Event { string kind; uint256 ts; string hash; }
    mapping(uint256 => Event[]) public events;
    function addEvent(uint256 batch, string memory k, string memory h) public {
        events[batch].push(Event(k, block.timestamp, h));
    }
}
