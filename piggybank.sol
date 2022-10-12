//SPDX-License-Identifier: none
pragma solidity ^0.8.17;

contract piggybank {
    event Deposit(uint amount);
    event Withdraw(uint amount);
    address public owner;
    constructor () {
        owner = msg.sender;
    }
    receive() external payable {
        emit Deposit(msg.value);
    }

    function withdraw() external {
        require(msg.sender == owner,"You are not the owner");
        emit Withdraw(address(this).balance);
        selfdestruct(payable (msg.sender));
    }
}
