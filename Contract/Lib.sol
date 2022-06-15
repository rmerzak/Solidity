pragma solidity 0.5.12;

library SafeMath {
    function add(uint _x, uint _y) internal pure returns (uint) {
        uint z = _x + _y;
        require(z >= _x, "uint overflow");
        return (z);
    }
}

library Array {
    function remove(uint [] storage arr, uint index) public {
        arr[index] = arr[arr.length - 1];
        arr.pop();
    }
}

contract TestLib {
    using SafeMath for uint;
    using Array for uint [];

    uint x = 123;
    //x.add(456);
    //SafeMath.add(x,456);
    function testadd(uint x,uint y) public pure returns (uint) {
        return (x.add(y));
    }

   /* function testarr() public {

    }*/
    
}