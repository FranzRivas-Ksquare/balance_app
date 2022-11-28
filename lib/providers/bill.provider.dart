import 'package:flutter/material.dart';
import 'package:balance/models/bill.model.dart';

class BillProvider extends ChangeNotifier {
  List<Bill> balance = [];

  addBill(Bill bill){
    balance.add(bill);
    notifyListeners();
  }

  removeBill(index){
    balance.removeAt(index);
  }

  getBalance(){
    return balance[0].type;
  }

}