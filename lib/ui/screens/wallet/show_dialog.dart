import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class  ShowDialogModel {
  int credit;
  ShowDialogModel({
    required this.credit,
  });
}


class ShowDialogData extends ChangeNotifier{
  int selectedIndex =0;
  List<ShowDialogModel> creditList = [
    ShowDialogModel(
      credit: 500
    ),
    ShowDialogModel(
      credit: 1000
    ),
    ShowDialogModel(
      credit: 2000
    ),
    ShowDialogModel(
      credit: 5000
    ),
    ShowDialogModel(
      credit: 10000
    ),
    ShowDialogModel(
      credit: 15000
    ),
    ShowDialogModel(
      credit: 25000
    ),
    ShowDialogModel(
      credit: 50000
    ),
  ];
  updateIndex(int index){
    selectedIndex =index;
    notifyListeners();
  }
   int get taskCount => creditList.length;
}