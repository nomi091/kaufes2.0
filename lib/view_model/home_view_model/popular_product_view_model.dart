import 'package:flutter/cupertino.dart';

import '../../data/responce/api_responce.dart';
import '../../model/category_model.dart';
import '../../repository/home_repo/popular_category_repo.dart';

class PopularProductViewModel with ChangeNotifier {
  PopularCategoryRepo myRepo = PopularCategoryRepo();
  ApiResponce<CategoryModel> getAllItemsData = ApiResponce.loading();

  setAllItemData(ApiResponce<CategoryModel> response) {
    getAllItemsData = response;
    debugPrint('ItemDatalist got');
    notifyListeners();
  }

  Future<void> getProductItems() async {
    setAllItemData(ApiResponce.loading());
    //remove after apis are done
    await Future.delayed(const Duration(seconds: 0));
    final mockResponse = CategoryModel(/* Add your mock data here */);
        setAllItemData(ApiResponce.completed(mockResponse));
    /// till here
    
    // myRepo.getCategories(1, 10).then((value) {
    //   setAllItemData(ApiResponce.completed(value));
    // }).onError((error, stackTrace) {
    //   setAllItemData(ApiResponce.error(error.toString()));
    // });
  }
}


