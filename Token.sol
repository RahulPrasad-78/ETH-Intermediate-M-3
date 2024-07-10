// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Token {
    address public owner;
    string public tokenName = "DUST";
    string public tokenAbbrv = "D";
    uint public totalSupply = 1000;
    
    mapping(address => uint) public balance;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function mint(address _addr, uint _val) public onlyOwner {
        totalSupply += _val;
        balance[_addr] += _val;
    }

    function burn(address _addr, uint _val) public onlyOwner {
        require(balance[_addr] >= _val, "Insufficient balance to burn");
        totalSupply -= _val;
        balance[_addr] -= _val;
    }

    function transfer(address _from, address _to, uint _val) public {
        require(balance[_from] >= _val, "Insufficient balance to transfer");
        balance[_from] -= _val;
        balance[_to] += _val;
    }

    function deposit(address _addr, uint _val) public onlyOwner {
        balance[_addr] += _val;
    }

    function getTotalBalance(address _addr) public view returns (uint) {
        return balance[_addr];
    }

    function isOwner() public view returns (bool) {
        return msg.sender == owner;
    }
}
