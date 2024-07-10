# Project Title

A simple smart contract for creating and managing a token named "DUST" with the abbreviation "D".

## Description

The Token contract allows users to mint new tokens, burn existing tokens, and keep track of token balances associated with different addresses. The contract demonstrates basic token management on the Ethereum blockchain.

## Getting Started

### Executing program

Follow these steps to set up and deploy the contract using Remix IDE:

1. **Open Remix IDE:**
   Go to [Remix IDE](https://remix.ethereum.org).

2. **Create a New File:**
   - In the left sidebar, click on the "+" icon to create a new file.
   - Name your file `Token.sol`.

3. **Paste the Solidity Code:**
   ```solidity
   // SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract MyToken {
    address public owner;
    string public tokenName = "DUST";
    string public tokenAbbrv = "D";
    uint public totalSupply = 0;
    
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


## Function Usage
### mint
The mint function allows the owner to create new tokens and add them to a specified address.

  Parameters:
  _addr: The address to which the newly minted tokens will be added.
  _val: The amount of tokens to mint.

### burn
The burn function allows the owner to destroy tokens from a specified address, reducing the total supply.

  Parameters:
  _addr: The address from which the tokens will be burned.
  _val: The amount of tokens to burn.

### transfer
The transfer function allows the transfer of tokens from one address to another.

  Parameters:
  _from: The address from which the tokens will be transferred.
  _to: The address to which the tokens will be transferred.
  _val: The amount of tokens to transfer.

### deposit
The deposit function allows the owner to deposit tokens to a specified address.

  Parameters:
  _addr: The address to which the tokens will be deposited.
  _val: The amount of tokens to deposit.

### getTotalBalance
The getTotalBalance function returns the total balance of tokens for a specified address.

  Parameters:
  _addr: The address for which to get the balance.
  
### isOwner
The isOwner function checks if the caller is the owner of the contract.

## Help

For common issues or problems, you can refer to the Remix IDE documentation or check the console for error messages.

## Authors

Contributors names and contact info:

Rahul Prasad
(rahulprasad4653@gmail.com)


