pragma solidity ^0.7.0;

contract Address {
    address payable private myAddress =
        0xaD335c3c503aBd738Af9a7690FB41f9fadcBE91A;
        
    enum Register{
        online,
        onsite
    }
    
    struct Student{
        string name;
        address _address;
        bool BS;
        Register register;
    }
    
    mapping (uint => Student) student;
    
    string[] std;
    
    uint amountCollected = 0;
    
    function addStudent(string memory name,address addr, bool bs, Register register) public{
        student[std.length] = Student(name, addr, bs, register);
        std.push(name);
    }

    function setAddress(address payable add) public {
        myAddress = add;
    }

    function getBalance() public view returns (uint256) {
        return myAddress.balance;
    }

    function getAddress() public view returns (address) {
        return myAddress;
    }

    function pay() public payable {
        myAddress.transfer(msg.value);
        amountCollected += msg.value;
    }
    
    function getCollectedAmount() public view returns(uint){
        return amountCollected;
    }
    
    function getNumberOfStudents()public view returns(uint){
        return std.length;
    }
}


