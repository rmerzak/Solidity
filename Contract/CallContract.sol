pragma solidity 0.5.12;

contract OtherContract {
    uint public x;
    uint public value;

    function setX(uint _x) public returns (uint) {
        x = _x;
        return (x);
    }

    function setXandSendEther(uint _x) public payable returns (uint, uint) {
        x = _x;
        value = msg.value;

        return (x, value);
    }
}

contract caller {
    function setX(OtherContract _calle, uint _x) public {
        uint x = _calle.setX(_x);
    }

    function setXFromAdress(address _addr, uint _x) public {
         OtherContract callee = OtherContract(_addr);
         uint x = callee.setX(_x);
    }

    function setXandEther(OtherContract _calle,uint _x) public payable {
        (uint _x, uint value) = _calle.setXandSendEther.value(msg.value)(_x);
    }
}

contract foo {
    uint public x;
    
    function setX(uint _x) public returns (uint) {
        x = _x;
        return (x);
    }
}