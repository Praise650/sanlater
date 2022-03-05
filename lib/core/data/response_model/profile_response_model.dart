// To parse this JSON data, do
//
//     final allDetailsModel = allDetailsModelFromJson(jsonString);

import 'dart:convert';

AllDetailsModel allDetailsModelFromJson(String str) =>
    AllDetailsModel.fromJson(json.decode(str));

String allDetailsModelToJson(AllDetailsModel data) =>
    json.encode(data.toJson());

class AllDetailsModel {
  AllDetailsModel({
    required this.message,
    required this.data,
  });

  String message;
  Data data;

  factory AllDetailsModel.fromJson(Map<String, dynamic> json) =>
      AllDetailsModel(
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
    this.accounts,
    this.balance,
    this.createdAt,
    this.updatedAt,
    this.provisionalBalance,
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.avatarUrl,
    this.isEmailVerified,
    this.v,
    // this.notificationToken,
    this.transactions,
  });

  List<Account>? accounts;
  int? balance;
  bool? isEmailVerified;
  bool? avatarUrl;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? provisionalBalance;
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  int? v;
  List<Transaction>? transactions;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accounts: List<Account>.from(
            json["accounts"].map((x) => Account.fromJson(x))),
        balance: json["balance"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        provisionalBalance: json["provisionalBalance"],
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phone: json["phone"],
        v: json["__v"],
        transactions: List<Transaction>.from(
            json["transactions"].map((x) => Transaction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "accounts": List<dynamic>.from(accounts!.map((x) => x.toJson())),
        "balance": balance,
        "createdAt": createdAt!.toIso8601String(),
        "provisionalBalance": provisionalBalance,
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "__v": v,
        "transactions":
            List<dynamic>.from(transactions!.map((x) => x.toJson())),
      };
}

class Account {
  Account({
    this.accountName,
    this.accountNumber,
    this.bank,
    required this.accountDefault,
    this.verificationCode,
    this.password,
    this.bankId,
  });

  String? accountName;
  String? accountNumber;
  String? bank;
  bool accountDefault;
  int? verificationCode;
  String? password;
  String? bankId;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        accountName: json["accountName"],
        accountNumber: json["accountNumber"],
        bank: json["bank"],
        accountDefault: json["default"],
        verificationCode: json["verificationCode"],
        password: json["password"],
        bankId: json["bankId"],
      );

  Map<String, dynamic> toJson() => {
        "accountName": accountName,
        "accountNumber": accountNumber,
        "bank": bank,
        "default": accountDefault,
        "verificationCode": verificationCode,
        "password": password,
        "bankId": bankId,
      };
}

class Transaction {
  Transaction(
      {required this.createdAt,
      this.status,
      required this.images,
      this.id,
      this.narration,
      this.amount,
      this.charge,
      this.currency,
      this.iconType,
      this.type,
      this.vendor,
      this.userId,
      this.v,
      this.tradeId,
      this.comments});

  DateTime createdAt;
  String? status;
  List<dynamic> images;
  String? id;
  String? narration;
  int? amount;
  int? charge;
  String? currency;
  String? iconType;
  String? type;
  String? vendor;
  String? userId;
  int? v;
  String? tradeId;
  String? comments;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        createdAt: DateTime.parse(json["createdAt"]),
        status: json["status"],
        images: List<dynamic>.from(json["images"].map((x) => x)),
        id: json["_id"],
        narration: json["narration"],
        amount: json["amount"],
        charge: json["charge"],
        currency: json["currency"],
        iconType: json["iconType"],
        type: json["type"],
        vendor: json["vendor"],
        userId: json["userId"],
        v: json["__v"],
        tradeId: json["tradeId"],
        comments: json["comments"] ?? "No comments",
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "status": status,
        "images": List<dynamic>.from(images.map((x) => x)),
        "_id": id,
        "narration": narration,
        "amount": amount,
        "charge": charge,
        "currency": currency,
        "iconType": iconType,
        "type": type,
        "vendor": vendor,
        "userId": userId,
        "__v": v,
        "tradeId": tradeId,
      };
}
