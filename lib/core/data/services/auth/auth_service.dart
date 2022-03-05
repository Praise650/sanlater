import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../api_urls.dart';

class AuthService {
  final Dio _dio = Dio();

  Future login({required String email, required String password}) async {
    var url = APIUrl.baseUrl + APIUrl.login;
    //body
    Map<String, String?> body = {"userId": email, "password": password};
    try {
      final response = await http.post(
        Uri.parse(url),
        body: body,
      );
      if (response.statusCode == 200) {
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
  }

  Future register(
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
      //decode response
      // AppResponse.showSuccess(
      //   response.body,
      // );
      // Future.delayed(const Duration(milliseconds: 450), () {
      //   Get.to(() => const SignUpBankDetailsView());
      // });
    } catch (e) {
      // AppResponse.showError(e,context);
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

  Future verifyOtp({required String otpCode}) async {
    var url = APIUrl.baseUrl + APIUrl.verify_otp;
    //body
    Map<String, dynamic> body = {"otp": otpCode};
    try {
      final response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        print(response.body);
      }
    } catch (e) {
      print(e);
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
