//SPDX-License-Identifer: MIT
pragma solidity 0.8.0;

contract moneysender {

    receiptmaker public createrecepit;

    mapping (address => uint) amountsent;
    address sender;
    mapping (address => address) to_and_from;

    function givemoney(address _towhom) payable public {

        payable(_towhom).call{value: msg.value}("");
        amountsent[msg.sender] += msg.value;
        sender = payable(msg.sender);
        to_and_from [msg.sender] = _towhom;
        createrecepit = new receiptmaker(amountsent[msg.sender], sender, to_and_from[msg.sender]);

    }

}

contract receiptmaker {

    uint public moneysent;
    address public sender;
    address public towhom;

    constructor(uint _moneysent, address _sender, address _towhom) {

        moneysent = _moneysent;
        sender = _sender;
        towhom = _towhom;

    }

}
