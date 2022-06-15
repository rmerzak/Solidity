pragma solidity 0.5.12;

contract Car {
    string public Model;
    address public owner;

    constructor (string memory _model, address _owner) public payable {
        Model = _model;
        owner = _owner;
    }
}

contract CarFactory {
    Car[] public cars;
    function create (string memory _model) public {
        Car car = new Car(_model, address(this));
        cars.push(car);
    }

    function createAndSenEther(address _owner, string memory _model) public payable {
        Car car = (new Car).value(msg.value)(_model, _owner);

        //contract.func.value(1 ether)(x, y, z)
        //(new contract).value(1 ether)(x, y, z)
    }
}