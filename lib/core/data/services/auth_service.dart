import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:sanlater/core/data/services/api_urls.dart';

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
      {String? email,
      String? firstName,
      String? lastName,
      String? phone,
      String? password}) async {
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
      _dio.options.headers['authorization'] =
          "a7088577abc1278cd95944d83b7c4501c6f5fad55ef74eff29a1ee8a0da700a938af1312d33f335bfa35ea0003d26cecff6cd7ddb6060a4ffd98cd3195fe4541";
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

  //   Future verifyEmail({String? email}) async {
  //   //url
  //   var url = APIUrl.baseUrl + APIUrl.verifyEmail;

  //   //body
  //   Map<String, String?> body = {
  //     "email": email,
  //   };
  //   //post request
  //   try {
  //     _dio.options.headers['authorization'] =
  //         "a7088577abc1278cd95944d83b7c4501c6f5fad55ef74eff29a1ee8a0da700a938af1312d33f335bfa35ea0003d26cecff6cd7ddb6060a4ffd98cd3195fe4541";
  //     final response = await _dio.post(url, data: body);
  //     //decode response
  //     AppResponse.showSuccess(
  //       response.data['message'],
  //     );
  //   } catch (e) {
  //     AppResponse.showError(e);
  //   }
  // }

  // Future updateProfile(
  //     {String? firstName, String? lastName, String? phoneNumber}) async {
  //   //url
  //   var url = APIUrl.baseUrl + APIUrl.updateProfile;

  //   //body
  //   Map<String, dynamic> body = {
  //     "firstName": firstName,
  //     "lastName": lastName,
  //     "phone": phoneNumber,
  //   };
  //   //get x-id-key
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   String? xIdKey = sharedPreferences.getString(AppStrings.xIdKey);
  //   //post request
  //   try {
  //     _dio.options.headers['authorization'] = APIUrl.accessKey;
  //     _dio.options.headers['x-admin-key'] = APIUrl.adminKey;
  //     _dio.options.headers['x-id-key'] = xIdKey!;
  //     final response = await _dio.patch(url, data: body);
  //     //decode response
  //     AppResponse.showSuccess(
  //       response.data["message"],
  //     );
  //     Future.delayed(const Duration(milliseconds: 450), () {
  //       Get.offAll(() => const DashBoardView());
  //     });
  //   } catch (e) {
  //     AppResponse.showError(e);
  //   }
  // }

  // Future changePassword({
  //   String? oldPassword,
  //   String? newPassword,
  // }) async {
  //   //url
  //   var url = APIUrl.baseUrl + APIUrl.changePassword;

  //   //body
  //   Map<String, dynamic> body = {
  //     "oldPassword": oldPassword,
  //     "newPassword": newPassword,
  //   };
  //   print(body);
  //   //get x-id-key
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   String? xIdKey = sharedPreferences.getString(AppStrings.xIdKey);
  //   //post request
  //   try {
  //     _dio.options.headers['x-id-key'] = xIdKey!;
  //     final response = await _dio.put(url, data: body);
  //     print(response.statusCode);
  //     //decode response
  //     AppResponse.showSuccess(
  //       response.data["message"],
  //     );
  //     // Future.delayed(const Duration(milliseconds: 450), () {
  //     //   Get.offAll(() => const SettingLoadingView());
  //     // });
  //   } catch (e) {
  //     AppResponse.showError(e);
  //   }
  // }

  // Future verifyForgotPasswordEmail({String? email}) async {
  //   //url
  //   var url = APIUrl.baseUrl + APIUrl.verifyForgotPasswordEmail;

  //   //body
  //   Map<String, String?> body = {
  //     "email": email,
  //   };
  //   print('====verify forgot password email =====');
  //   print(body);
  //   //post request
  //   try {
  //     _dio.options.headers['authorization'] =
  //         "a7088577abc1278cd95944d83b7c4501c6f5fad55ef74eff29a1ee8a0da700a938af1312d33f335bfa35ea0003d26cecff6cd7ddb6060a4ffd98cd3195fe4541";
  //     final response = await _dio.post(url, data: body);
  //     //decode response
  //     AppResponse.showSuccess(
  //       response.data['message'],
  //     );
  //     Future.delayed(const Duration(milliseconds: 450), () {
  //       Get.to(() => ForgotPasswordVerificationView(
  //             email: email!,
  //           ));
  //     });
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     AppResponse.showError(e);
  //   }
  // }

  // Future resetPassword(
  //     {String? email, String? password, String? verifyCode}) async {
  //   //url
  //   var url = APIUrl.baseUrl + APIUrl.resetPassword;

  //   //body
  //   Map<String, String?> body = {
  //     "email": email,
  //     "password": password,
  //     "verificationCode": verifyCode,
  //   };
  //   //post request
  //   try {
  //     _dio.options.headers['authorization'] =
  //         "a7088577abc1278cd95944d83b7c4501c6f5fad55ef74eff29a1ee8a0da700a938af1312d33f335bfa35ea0003d26cecff6cd7ddb6060a4ffd98cd3195fe4541";
  //     final response = await _dio.patch(url, data: body);
  //     //decode response
  //     AppResponse.showSuccess(
  //       response.data['message'],
  //     );
  //     Future.delayed(const Duration(milliseconds: 450), () {
  //       Get.to(() => const PasswordChangedSuccess());
  //     });
  //   } catch (e) {
  //     AppResponse.showError(e);
  //   }
  // }

  Future getProfile() async {
    final url = 'https://sanlater.herokuapp.com/api/v1/customer/me';
    final response = http.get(
      Uri.parse(url),
    );
    // if (response.stat) {
    //
    // }
  }
}
