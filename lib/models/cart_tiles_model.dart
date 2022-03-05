class CartTilesModel {
  final String desc;
  final String category;
  final String price;
  int numberOfItem;
   bool isChecked;
  CartTilesModel({
    required this.desc,
    required this.price,
    required this.category,
    this.numberOfItem=0,
    this.isChecked=false,
  });
}