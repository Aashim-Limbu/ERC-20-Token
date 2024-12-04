// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;
import {Test, console} from "forge-std/Test.sol";
import {OurToken} from "src/OurToken.sol";
import {DeployOurToken} from "script/OurToken.s.sol";

contract OurTokenTest is Test {
    OurToken public ourToken;
    DeployOurToken public deployer;
    address person1 = makeAddr("Aashim");
    address person2 = makeAddr("Test");
    uint256 constant STARTING_BALANCE = 100 ether;

    function setUp() public {
        deployer = new DeployOurToken();
        ourToken = deployer.run();
        vm.prank(msg.sender); //default anvil sender 0x1804c------f38
        ourToken.transfer(person1, STARTING_BALANCE);
    }

    function testAashimBalance() public view {
        assertEq(STARTING_BALANCE, ourToken.balanceOf(person1));
    }

    function testAllowance() public {
        uint256 initialAllowance = 1000;
        // Person1 approve Person2 to spend token on his/her behalf
        vm.prank(person1);
        ourToken.approve(person2, initialAllowance);

        uint256 transferAmount = 500;
        vm.prank(person2);
        ourToken.transferFrom(person1, person2, transferAmount);
        assertEq(ourToken.balanceOf(person2), transferAmount);
    }
}
