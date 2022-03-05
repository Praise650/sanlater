import 'package:sanlater/core/data/response_model/product_response_model.dart';
import 'package:sanlater/core/data/services/products/fetch_product_service.dart';
import 'package:sanlater/core/helpers/helper.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../api_urls.dart';

class FetchProductImpl implements FetchProductService {
  //TODO: add parameters to url
  @override
  Future fetchProduct({String? searchQuery, int? page}) async{
    var url = "https://sanlatar.herokuapp.com/api/v1/products?search=$searchQuery&page=$page";

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? xIdKey = sharedPreferences.getString(AppStrings.xIdKey);

    Map<String, String>  headers = {"x-id-key": xIdKey!};
    try {
      final response = await http.get(Uri.parse(url),headers: headers,);
    if(response.statusCode == 200){
      print(response.body);
      return productResponseModelFromJson(response.body);
    }
    } catch (e) {
    }
  }


  @override
  Future fetchProductById({String? productId}) async {
    var url = "https://sanlatar.herokuapp.com/api/v1/product/$productId";

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? xIdKey = sharedPreferences.getString(AppStrings.xIdKey);

    Map<String, String> headers = {
      "x-id-key": xIdKey!,
    };
    try{
    final response = await http.get(Uri.parse(url),headers: headers);
    if(response.statusCode == 200){
      print(response.body);
      return productResponseModelFromJson(response.body);
    }
    }catch(e){
      print(e);
    }
  }
}