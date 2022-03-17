import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sanlater/core/data/response_model/auth/login_response.dart';
import 'package:sanlater/core/data/response_model/auth/register_response.dart';
import 'package:sanlater/core/helpers/helper.dart';
import 'package:sanlater/ui/screens/phone_auth/phone_screen.dart';
import '../api_urls.dart';

class AuthService {
  final Dio _dio = Dio();

  Future login(BuildContext context,
      {required String email, required String password}) async {
    var url = APIUrl.baseUrl + APIUrl.login;
    //body
    Map<String, String?> body = {"userId": email, "password": password};
    try {
      final response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        print(response.body);
        final res = loginResponseFromJson(response.body);
        AppResponse.showSuccess(res.message, context);
        Future.delayed(const Duration(milliseconds: 450), () {
          Get.to(() => PhoneNumberAuthScreen());
        });
      }
    } catch (e) {
      print(e);
      AppResponse.showError(e, context);
    }
  }

  Future register(BuildContext context,
      {required String? email,
      required String? firstName,
      required String? lastName,
      required String? phone,
      required String? password}) async {
    //url
    var url = APIUrl.baseUrl + APIUrl.register;

    //body
    Map<String, String?> body = {
      "firstName": firstName,
      "lastName": lastName,
      "password": password,
      "email": email,
      "phone": phone,
    };
    //post request
    try {
      // _dio.options.headers['authorization'] =
      //     "a7088577abc1278cd95944d83b7c4501c6f5fad55ef74eff29a1ee8a0da700a938af1312d33f335bfa35ea0003d26cecff6cd7ddb6060a4ffd98cd3195fe4541";
      final response = await http.post(Uri.parse(url), body: body);
      final res = registerResponseFromJson(response.body);
      //decode response
      AppResponse.showSuccess(res.message, context);
      Future.delayed(const Duration(milliseconds: 450), () {
        Get.to(() => PhoneNumberAuthScreen());
      });
    } catch (e) {
      AppResponse.showError(e, context);
    }
  }

  Future getprofile() async {
    var url = APIUrl.baseUrl + APIUrl.profile + APIUrl.me;
    //body
    try {
      final response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
  }

  Future fetchallcategory() async {
    var url = APIUrl.baseUrl + APIUrl.category;
    //body
    try {
      final response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
  }

  Future verifyOtp(BuildContext context, {required String otpCode}) async {
    var url = APIUrl.baseUrl + APIUrl.verify_otp;
    //body
    Map<String, dynamic> body = {"otp": otpCode};
    try {
      final response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        print(response.body);
        final res = registerResponseFromJson(response.body);
        AppResponse.showSuccess(res.message, context);
      }
    } catch (e) {
      print(e);
      AppResponse.showError(e, context);
    }
  }

  Future refreshtoken() async {
    var url = APIUrl.baseUrl + APIUrl.refresh_token;
    //body
    Map<String, dynamic> body = {"refresh_token": 'e'};
    try {
      final response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
  }
}
