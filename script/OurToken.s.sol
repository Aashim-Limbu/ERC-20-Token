// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;
import {Script} from "forge-std/Script.sol";
import {OurToken} from "src/OurToken.sol";

contract DeployOurToken is Script {
    uint256 constant public INITIAL_SUPPLY = 1000 ether;

    function run() external returns (OurToken) {
        vm.startBroadcast();
        OurToken ourToken = new OurToken(INITIAL_SUPPLY);
        vm.stopBroadcast();
        return ourToken;
    }
}
