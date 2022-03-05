import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:sanlater/models/bills_model.dart';
class PayBillViewModel extends ChangeNotifier{
List<BillsModel> _bills = [
  BillsModel(bill: 'Cable TV'),
  BillsModel(bill: 'Utility'),
  BillsModel(bill: 'School Payment'),
  BillsModel(bill: 'Electricity'),
  BillsModel(bill: 'Church Payment'),
  BillsModel(bill: 'Internet Service'),
];
// String? get bill{
//   for(int i =0; i<bills.length; i++){
//     return bills[i].bill;
//   }
// }

int get billLength{
  return _bills.length;
}

UnmodifiableListView<BillsModel> get bills{
  return UnmodifiableListView(_bills);
}

}
