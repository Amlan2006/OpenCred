// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Certification} from "../src/Certification.sol";

contract CertificationScript is Script {
    Certification public certification;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        certification = new Certification();

        vm.stopBroadcast();
    }
}
