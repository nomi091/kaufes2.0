import 'package:flutter/cupertino.dart';
import 'package:kaufes/repository/home_repo/category_repo.dart';

import '../../data/responce/api_responce.dart';
import '../../model/category_model.dart';

class CategoryViewModel with ChangeNotifier {
  CategoryRepo myRepo = CategoryRepo();
  ApiResponce<CategoryModel> getAllItemsData = ApiResponce.loading();

  setAllItemData(ApiResponce<CategoryModel> response) {
    getAllItemsData = response;
    debugPrint('ItemDatalist got');
    notifyListeners();
  }

  Future<void> getCategoryItems() async {
    setAllItemData(ApiResponce.loading());
    //remove after apis are done
    await Future.delayed(const Duration(seconds: 2));
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


