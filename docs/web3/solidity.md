# Solidity
## Layout of Solidity Source File
#### Import Paths
<details>
  <summary>Example</summary>
  
  ```solidity
  import "./crosscontract.sol";
  ```
</details>


## Contracts

<details>
  <summary>Contract Structure</summary>
  
  ```solidity
  pragma solidity >=0.5.0 <0.6.0;
  pragma solidity ^0.8.15;
  
  contract helloWorld {}
  ```
</details>

<details>
  <summary>Function Modifier</summary>
  
  ```solidity
  pragma solidity ^0.8.15;
  
  modifier onlyOwner {
        require(
            msg.sender == owner,
            "Only owner can call this function."
        );
        _;
    }
  ```
</details>

### Visibility and Getters
#### Function Visibility
<details>
  <summary>Public</summary>
  
  ```solidity
  function eat(string memory _name, uint _amount) public {

  }
  ```
</details>

<details>
  <summary>Private</summary>
  
  ```solidity
  function eat(string memory _name, uint _amount) private {

  }
  ```
</details>

<details>
  <summary>Internal</summary>
  
  ```solidity
  function eat(string memory _name, uint _amount) internal {

  }
  ```
</details>
<details>
  <summary>External</summary>
  
  ```solidity
  function eat(string memory _name, uint _amount) external {

  }
  ```
</details>

#### Inheritance
<details>
  <summary>Example</summary>
  
  ```solidity
  contract Animal {
    function makeSound() public returns (string memory){

    }
  }
  // Dog inherit Animal, so have access to both makeSound function and bark
  contract Dog is Animal {
    function bark() public returns (string memory){
      
    }
  }
  ```
</details>
### Function
<details>
  <summary>State Mutability</summary>
  
  ```solidity
  // View - only viewing the data not modifying
  function sayHello() public view returns (string memory) {}
  
  // Pure - not accessing any data in the app
  function _multiply(uint a, uint b) private pure returns (uint) {
    return a * b;
  }
  ```
</details>

## Types

### Value Types
#### Integer
int8 to int256

int = int256
uint = uint256

### Reference Types
#### Struct
<details>
  <summary>Example</summary>
  
  ```solidity
  struct Person {
    uint age;
    string name;
  }
  ```
</details>

#### Arrays
<details>
  <summary>Example</summary>
  
  ```solidity
  // Array with a fixed length of 2 elements:
  uint[2] fixedArray;
  // another fixed Array, can contain 5 strings:
  string[5] stringArray;
  // a dynamic Array - has no fixed size, can keep growing:
  uint[] dynamicArray;
  ```
</details>

### Expressions and Control Structures
#### Require
<details>
  <summary>Example</summary>
  
  ```solidity
  require(3 > 0);
  ```
</details>
#### Assert