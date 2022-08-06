//By Piyush Karmhe
///@custom:dev-run-script file_path
//SPDX-License-Identifier: GPT-3
pragma solidity >=0.8.4;

contract lending{

    //Keep Checking mssg String and stat bool Values for Status

    uint256 public txn_count = 0; //To count Transactions
    string public mssg; //To provide message
    bool public stat;//To provide bool message

    mapping(address => USER) public users;
    mapping(address => TXN) public txn;

    //User structure
    struct USER{
        string name;
        string pass;
    }

    //Transaction structure
    struct LENDER{
        string[] what;
        string[] date;
        bool[] status;
        uint256 lender_count;
    }

    struct TXN{
        uint256 count;
        address[] lenders;
        mapping(address => LENDER) lender;
    }

    //To Register User
    function reg_user(string memory _name, string memory _pass) public{
        users[msg.sender] = USER(_name,_pass);
        mssg = "Registered!";
    }

    //To Lend Items
    function lend (address _to, string memory _what, string memory _date) public{
        txn[msg.sender].count += 1;
        txn_count +=1;
        txn[msg.sender].lenders.push(_to);

        string[] storage w;
        w = txn[msg.sender].lender[_to].what;
        w.push(_what);
        txn[msg.sender].lender[_to].what = w;

        string[] storage d;
        d = txn[msg.sender].lender[_to].date;
        d.push(_date);
        txn[msg.sender].lender[_to].date = d;

        bool[] storage s;
        s = txn[msg.sender].lender[_to].status;
        s.push(true);
        txn[msg.sender].lender[_to].status = s;

        txn[msg.sender].lender[_to].lender_count += 1;
        mssg = "Lended!";
    }

    //To Return Items
    function returning (address _to, string memory _what) public{
        string[] storage w = txn[_to].lender[msg.sender].what;
        bool[] storage s = txn[_to].lender[msg.sender].status;
        uint256 c = txn[_to].lender[msg.sender].lender_count;
        uint256 i;
        for(i=0;i<c;i++){
            if((keccak256(abi.encodePacked(w[i])) == keccak256(abi.encodePacked(_what)))&&(s[i])){
                break;
            }
        }
        if(i!=c){
            s[i] = false;
            txn[_to].lender[msg.sender].status = s;
            mssg = "Returned";
        }
        else{
            mssg = "Invalid Record!!";
        }
    }

    //To Check Borrowed Items
    function borrowed (address _to, string memory _what) public {
        string[] storage w = txn[_to].lender[msg.sender].what;
        bool[] storage s = txn[_to].lender[msg.sender].status;
        uint256 c = txn[_to].lender[msg.sender].lender_count;
        uint256 i;
        for(i=0;i<c;i++){
            if((keccak256(abi.encodePacked(w[i])) == keccak256(abi.encodePacked(_what)))&&(s[i])){
                mssg = "Not Returned!";
                break;
            }
            else if(keccak256(abi.encodePacked(w[i])) == keccak256(abi.encodePacked(_what))){
                mssg = "Have Returned!";
                break;
            }
        }

        if(i==c){
            mssg = "No Record Found!!";
        }
    }

    //To check Return status of own Items
    function returned (address _to, string memory _what) public{
        string[] storage w = txn[msg.sender].lender[_to].what;
        bool[] storage s = txn[msg.sender].lender[_to].status;
        uint256 c = txn[msg.sender].lender[_to].lender_count;
        uint256 i;
        stat = false;
        bool found = false;
        mssg = "";
        for(i=0;i<c;i++){
            if((keccak256(abi.encodePacked(w[i])) != keccak256(abi.encodePacked("")))&&(s[i])){
                string.concat(mssg, w[i]);
                string.concat(mssg, ", ");
            }
            if((keccak256(abi.encodePacked(w[i])) == keccak256(abi.encodePacked(_what)))&&(!s[i])){
                stat = true;
            }
            else if(keccak256(abi.encodePacked(w[i])) == keccak256(abi.encodePacked(_what))){
                found = true;
            }
        }
        if(!found){
            stat = true;
        }
    }
}
