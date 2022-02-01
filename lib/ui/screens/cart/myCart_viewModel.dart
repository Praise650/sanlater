import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:sanlater/models/cart_tiles_model.dart';
class MyCartViewModel with ChangeNotifier{
  List<CartTilesModel> _cartList = [
    CartTilesModel(desc: 'Suede Shoe', price:'#2000', category: 'Shoes',),
    CartTilesModel(desc: 'Suede Shoe', price:'#4000', category: 'Shoes',),
    CartTilesModel(desc: 'Suede Shoe', price:'#5000', category: 'Shoes',),
    CartTilesModel(desc: 'Suede Shoe', price:'#5000', category: 'Shoes'),
  ];
  int _numberOfItem = 0;
  int get listLength{
    return _cartList.length;
  }
  increaseNumberOfItem(int index){
    _cartList[index].numberOfItem++;
    notifyListeners();
  }
  decreaseNumberOfItem(int index){
      if(_cartList[index].numberOfItem >0) {
        _cartList[index].numberOfItem--;
        notifyListeners();
      }
      else{
        _cartList[index].numberOfItem = 0;
        notifyListeners();
      }
  }
  UnmodifiableListView get cartList{
    return UnmodifiableListView(_cartList);
  }
  int get numberOfItems{
    return _numberOfItem;
  }
   void toggleCheckBox(bool checked, int index){
        _cartList[index].isChecked=checked;
       notifyListeners();
     }
     void deleteList(index){
    _cartList.remove(_cartList[index]);
    notifyListeners();
     }
  }
