import 'package:flutter/cupertino.dart';

class ProductDetailsVeiwModel{
  String imageUrl;
  String productName;
  int? rating;
  int price;
  String description;
  String? reviews;
  ProductDetailsVeiwModel({
    required this.productName,
    required this.imageUrl,
    required this.description,
    required this.price,
    this.rating,
    this.reviews,
  });
}

class ProductDetailsData extends ChangeNotifier{
  int multiplier=1;
  ProductDetailsVeiwModel productDetailsVeiwModel = ProductDetailsVeiwModel(
    productName: '',
    imageUrl: '',
    description: '',
    price: 4000,
  );

  updatePrice(){
    productDetailsVeiwModel.price *= multiplier;
    notifyListeners();
  }

  increment(){
    multiplier += 1;
    notifyListeners();
  }
  decrement(){
    multiplier == 1? multiplier = 1 : multiplier -= 1;
    notifyListeners();
  }
}