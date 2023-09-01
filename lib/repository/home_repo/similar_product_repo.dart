
import 'package:kaufes/model/category_model.dart';

import '../../data/network/network-api_responce.dart';
import '../../utils/constants/app_url.dart';

class SimilarProductRepo {
  final NetworkApiService _apiService = NetworkApiService();
  Future<CategoryModel> getProducts(int page, int size) async {
    try {
      dynamic response = await _apiService.getApiResponse(
        '${AppUrl.categoryList}?_isPopular=true&size=$size&page=$page',
        null,
        false,
      );

      return CategoryModel.fromJson(response);
    } catch (e) {
      throw Exception(e);
    }
  }
}
