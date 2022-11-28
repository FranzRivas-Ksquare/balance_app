import 'package:flutter/material.dart';
import 'package:balance/models/bill.model.dart';

class BillProvider extends ChangeNotifier {
  List<Bill> balance = [];
  num total = 0;

  addBill(Bill bill){
    balance.add(bill);
    notifyListeners();
  }

  removeBill(index){
    balance.removeAt(index);
  }

  getTotal(){
    num calc = 0;
    for (int i = 0; i < balance.length; i++) {
      calc = calc + balance[i].amount;
    }
    total = calc;
    notifyListeners();
  }

}