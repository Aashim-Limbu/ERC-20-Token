// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

//ERC TOKEN STANDARDS from https://eips.ethereum.org/EIPS/eip-20

contract ManualContract {
    mapping(address => uint256) s_balances;

    function name() public pure returns (string memory) {
        return "Manual Token";
    }

    //Returns the number of decimals the token uses - e.g. 8, means to divide the token amount by 100000000 to get its user representation.
    function decimals() public view returns (uint8) {
        return 18;
    }

    function totalSupply() public pure returns (uint256) {
        return 100 ether; //100 * 10e18
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return s_balances[_owner];
    }

    function transfer(
        address _to,
        uint256 _amount
    ) public returns (bool success) {
        uint256 previousBalances = balanceOf(msg.sender) + balanceOf(_to);
        s_balances[msg.sender] -= _amount;
        s_balances[_to] += _amount;
        require(balanceOf(msg.sender) + balanceOf(_to) == previousBalances);
    }
}
