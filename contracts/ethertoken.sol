pragma solidity ^0.4.24;

import "./baseerc20token.sol";

contract EtherToken is BaseERC20Token {
    constructor(string _name, string _symbol)
        BaseERC20Token(0, 18, _name, _symbol) public
    {
    }

    function buy() public payable {
        balanceOf[msg.sender] += msg.value;
        totalSupply += msg.value;

        emit Transfer(address(0), msg.sender, msg.value);
    }

    function sell(uint256 amount) public {
        require(balanceOf[msg.sender] >= amount, "Insufficient balance.");

        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
        msg.sender.transfer(amount);

        emit Transfer(msg.sender, address(0), amount);
    }
}
