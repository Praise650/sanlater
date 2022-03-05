import 'package:dio/dio.dart';
import 'package:sanlater/core/data/response_model/profile_response_model.dart';
import 'package:sanlater/core/data/services/api_urls.dart';
import 'package:sanlater/core/helpers/helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'profile_service.dart';
import 'package:http/http.dart' as http;

class ProfileServiceImpl implements ProfileService{
  Dio dio = Dio();
  @override
  Future getUserProfile() async {

    var url = APIUrl.baseUrl + APIUrl.fetchProfile;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? xIdKey = sharedPreferences.getString(AppStrings.xIdKey);

    Map<String, String> headers = {
      "x-id-key": xIdKey!,
    };
    try{
    final response = await http.get(Uri.parse(url),headers: headers);
    if(response.statusCode == 200){
      print(response.body);
      return allDetailsModelFromJson(response.body);
    }
    }catch(e){
      print(e);
    }
  }

  @override
  Future updateProfile({String? firstName,String? lastName,String? phoneNumber}) async{
    var url = APIUrl.baseUrl + APIUrl.updateProfile;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? xIdKey = sharedPreferences.getString(AppStrings.xIdKey);

    Map<String, String> headers = {
      "x-id-key": xIdKey!,
    };

    Map<String, dynamic> body = {
       "firstName": firstName,
    "lastName": lastName,
    "phoneNumber": phoneNumber,
    };
    try {
      final response = await http.patch(Uri.parse(url),body: body,headers: headers);
      if(response.statusCode == 200){
        print(response.body);
      }
    } catch (e) {
    }
  }

  @override
  Future addAvatar({String? imgUrl}) async{
    var url = APIUrl.baseUrl + APIUrl.avatar;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? xIdKey = sharedPreferences.getString(AppStrings.xIdKey);

    // Map<String, String> headers = {
    //   "x-id-key": xIdKey!,
    // };

    Map<String, dynamic> body = {
       "avatar": imgUrl,
    };
    try {
      dio.options.headers = {
        "x-id-key": xIdKey,
      };
      FormData formData = new FormData.fromMap(body);
      final response = await dio.post(url,data: formData);
      // final response = await http.post(Uri.parse(url),body: formData,headers: headers);
      if(response.statusCode == 200){
        print(response.data);
      }
    } catch (e) {
    }
  }

  @override
  Future fetchUserById({String? userId}) async{
   var url = APIUrl.baseUrl + "/user/$userId";
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? xIdKey = sharedPreferences.getString(AppStrings.xIdKey);

    Map<String, String> headers = {
      "x-id-key": xIdKey!,
    };
    try {
      final response = await http.get(Uri.parse(url),headers: headers);
      if(response.statusCode == 200){
        print(response.body);
      }
    } catch (e) {
    }
  }
}