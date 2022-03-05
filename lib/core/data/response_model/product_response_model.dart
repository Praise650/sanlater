// To parse this JSON data, do
//
//     final allDetailsModel = allDetailsModelFromJson(jsonString);

import 'dart:convert';

ProductResponseModel productResponseModelFromJson(String str) =>
    ProductResponseModel.fromJson(json.decode(str));

String productResponseModelToJson(ProductResponseModel data) =>
    json.encode(data.toJson());

class ProductResponseModel {
  ProductResponseModel({
    required this.message,
    required this.data,
  });

  String message;
  Data data;

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) =>
      ProductResponseModel(
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
    this.id,
    this.producName,
    this.description,
    this.unit_price,
    this.inventory_count,
    this.category_id,
    this.images,
    this.isAvailable,
    this.rating_count,
    this.rating_total,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? producName;
  String? description;
  int? unit_price;
  int? inventory_count;
  String? category_id;
  List<String>? images;
  bool? isAvailable;
  int? rating_count;
  int? rating_total;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    producName: json["name"],
    description: json["description"],
    unit_price: json["unit_price"],
    inventory_count: json["inventory_count"],
    category_id: json["category_id"],
    images: json["images"],
    isAvailable: json["isAvailable"],
    rating_count: json["rating_count"],
    rating_total:json["rating_total"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    );

  Map<String, dynamic> toJson() => {
    "_id":id,
    "name": producName,
    "description":description,
    "unit_price":unit_price,
     "inventory_count":inventory_count,
    "category_id":category_id,
    "images":images,
    "isAvailable":isAvailable,
    "rating_count":rating_count,
    "rating_total":rating_total,
    "createdAt": createdAt!.toIso8601String(),
    "__v": v,
      };
}

