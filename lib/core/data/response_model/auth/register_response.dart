// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

RegisterResponse registerResponseFromJson(String str) =>
    RegisterResponse.fromJson(json.decode(str));

String resgisterResponseToJson(RegisterResponse data) =>
    json.encode(data.toJson());

class RegisterResponse {
  RegisterResponse({
    required this.message,
    required this.token,
  });

  String message;
  String token;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
        message: json["message"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
      };
}

// class Data {
//   Data({
//     required this.firstName,
//     required this.lastName,
//     required this.password,
//     required this.email,
//     required this.phone,
//   });

//   String firstName;
//   String lastName;
//   int? password;
//   String email;
//   bool phone;

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//       firstName: json["firstName"],
//       lastName: json["lastName"],
//       password: json["password"],
//       email: json["email"],
//       phone: json["phone"]);

//   Map<String, dynamic> toJson() => {
//         "firstName": firstName,
//         "lastName": lastName,
//         "password": password,
//         "email": email,
//         "phone": phone,
//       };
// }
