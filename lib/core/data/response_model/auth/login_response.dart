// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.message,
    required this.data,
  });

  String message;
  Data data;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data(
      {required this.firstName,
      required this.lastName,
      required this.id,
      required this.email,
      required this.isEmailVerified,
      this.avatarUrl,
      required this.createdAt,
      required this.accounts,
      required this.v,
      required this.balance,
      required this.provisionalBalance,
      required this.updatedAt});

  String firstName;
  String lastName;
  String id;
  String email;
  String? avatarUrl;
  bool isEmailVerified;
  int balance;
  int provisionalBalance;
  List accounts;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        avatarUrl: json["avatarUrl"],
        isEmailVerified: json["isEmailVerified"],
        accounts: json["accounts"],
        balance: json["balance"],
        provisionalBalance: json["provisionalBalance"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "avatarUrl": avatarUrl,
        "isEmailVerified": isEmailVerified,
        "accounts": accounts,
        "balance": balance,
        "provisionalBalance": provisionalBalance,
        "createdAt": createdAt,
        "updatedAt": updatedAt.microsecondsSinceEpoch,
        "__v": v
      };
}
