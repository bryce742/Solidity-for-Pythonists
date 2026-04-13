
# Before getting into the the third contract, let's discuss data storage and variable types more

In solidity, some types (such as string) need a data location.

## Variables that don't need *memory* store very simple data
- uint256
- bool
- address
- bytes32

## Reference variables point to more complex data, so solidity wants to know where the data lives
- string
- bytes
- arrays
- structs
- mappings

- the memory keyword tells solidity to temporarily store the complex data type reference in memory
```solidity
    function setName(string memory _newName) public {
        name = _newName;
    }
```
_newname is temporary stored into memory so that it can be used (in and during the lifetime of the function) to set the name state variable

## Three main data locations and keywords
- storage (**permanent** on-chain storage)
- memory (**temporary** memory using to store variables during a function call)
- calldata (**read-only external input** data for EXTERNAL function calls. worry about later!)


# Contract 3 Syntax
```solidity

```