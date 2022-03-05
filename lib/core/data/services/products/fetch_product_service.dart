abstract class FetchProductService {
  Future fetchProduct({String? searchQuery, int? page});
  Future fetchProductById({String? productId,});
}