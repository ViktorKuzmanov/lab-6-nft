// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {MyNFT} from "../src/MyNFT.sol";

contract CounterScript is Script {
    MyNFT public myNFT;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        myNFT = new MyNFT(msg.sender);

        vm.stopBroadcast();
    }
}
