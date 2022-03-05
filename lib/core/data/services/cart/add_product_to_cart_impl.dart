import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:sanlater/core/data/response_model/cart_product_response_model.dart';
import 'package:sanlater/core/data/services/api_urls.dart';
import 'package:sanlater/core/data/services/cart/add_product_to_cart_service.dart';
import 'package:sanlater/core/helpers/helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddProductToCartImpl implements AddProductTocartService{
  @override
  Future addProductToCart({String? productId,int? quantity}) async{
    var url = APIUrl.baseUrl + APIUrl.cart_product;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? xIdKey = sharedPreferences.getString(AppStrings.xIdKey);

    Map<String, String> headers = {
      "x-id-key": xIdKey!,
    };
    Map<String, dynamic> body = {
      "productId": productId,
      "quantity": quantity,
    };
    try {
      final http.Response response = await http.post(Uri.parse(url),body: body,headers: headers);
      if (response.statusCode == 200) {
        print(response.body);
        final res = json.decode(response.body);
        print(res['message']);
        // return cartProductModelFromJson(response.body);
      }
    } catch (e) {
    }
  }
  
}