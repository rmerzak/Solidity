pragma solidity 0.5.12;

    /*ways to send ether from a contract to another contract
    -transfer (2300gas throw errors)
    -send  (2300gas return bool)
    -call (forward all gas or set gas, return bool)
    */
contract SendEther {
    function () external payable {}

    function getBalance() public view returns (uint) {
        return address(this).balance;

}
}

contract RecieveEther {
    function sendViaTransfer(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) public payable {
        bool sent = _to.send(msg.value);
        require(sent,"Failed to send Ether");
    }
    function sendViaCall(address payable _to) public payable {
        (bool sent, bytes memory data) = _to.call.value(msg.value)("");
        require(sent,"Failed to send Ether");
    }
}