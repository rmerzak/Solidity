pragma solidity ^0.5.12;


contract Reciever {

    event Recieved(address caller, uint amount, string message);
    
    function () external payable {
        emit Recieved(msg.sender, msg.value, "Fall back was called");
    }
    function foo(string memory _message, uint _x) public payable returns (uint) {
        emit Recieved(msg.sender, msg.value, _message);

        return _x + 1;
    }
}


contract Caller {

    event Response(bool seccess, bytes data);

    function testCallFoo(address payable addr) public payable {
        (bool success, bytes memory data) = addr.call.value(msg.value).gas(5000)(
            abi.encodeWithSignature("foo(string,uint256)", "call foo", 123));

        emit Response(success, data);
    }

    function testCallDoesnot(address payable addr) public payable {
        (bool success, bytes memory data) = addr.call.value(msg.value).gas(500)(
            abi.encodeWithSignature("noo()"));

        emit Response(success, data);
    }
}