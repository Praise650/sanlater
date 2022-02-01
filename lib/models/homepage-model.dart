class HomepageModel{
  final String itemName;
  final String imageLink;
  final String price;
  int? rating;
  String? description;
  String? reviews;
  HomepageModel({
    required this.itemName,
    required this.imageLink,
    required this.price,
    required this.description,
  });
}