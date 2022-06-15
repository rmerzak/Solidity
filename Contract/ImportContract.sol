pragma solidity 0.5.12;

import "./Foo.sol";

contract Cimport {
    Foo foo = new Foo();
    function getFooName() public view returns (string memory) {
        return foo.name();
    }
}