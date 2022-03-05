import 'dart:convert';

CartProductModel cartProductModelFromJson(String str) =>
    CartProductModel.fromJson(json.decode(str));

String cartProductModelToJson(CartProductModel data) =>
    json.encode(data.toJson());

class CartProductModel {
  CartProductModel({
    required this.message,
    required this.data,
  });

  String message;
  Data data;

  factory CartProductModel.fromJson(Map<String, dynamic> json) =>
      CartProductModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.cart_id,
    this.product_id,
    this.quantity,
    this.createdAt,
    this.updatedAt,
    this.price,
    this.id,
    this.v,
  });
  String? cart_id;
  String? product_id;
  int? quantity;
  int? price;
  String? id;
  int? v;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        cart_id: json["cart_id"],
        product_id: json["product_id"],
        quantity: json["quantity"],
        price: json["price"],
        id: json["_id"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "cart_id": cart_id,
        "product_id": product_id,
        "quantity": quantity,
        "price": price,
        "_id": id,
        "__v": v,
        "createdAt": createdAt!.toIso8601String(),
      };
}