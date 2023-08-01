import 'package:flutter/cupertino.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:kaufes/repository/home_repo/category_repo.dart';

import '../../data/responce/api_responce.dart';
import '../../model/category_model.dart';
import 'package:image_picker/image_picker.dart';

class CreateAdViewModel with ChangeNotifier {
  CategoryRepo myRepo = CategoryRepo();
  ApiResponce<CategoryModel> getAllItemsData = ApiResponce.loading();

  final ImagePicker _picker = ImagePicker();
  List imagePath = [];
  List multipleImagePicker = [];
  List<String>? imageURL = [];
  XFile? video;
  String videoName = "";
  String videoLink = "";
  TextEditingController phoneNoController = TextEditingController();
  PhoneNumber? phoneNo=PhoneNumber(isoCode: 'DE');
  Future<void> selectMedia(ImageSource source) async {
    // images.clear();
    imagePath.clear();
    imageURL!.clear();

    if (source == ImageSource.camera) {
      final XFile? imageFromGallery = await _picker.pickImage(source: source);
      if (imageFromGallery != null) {
        imagePath.add(imageFromGallery.path.toString());
        // images.add(imageFromGallery);
      }
    } 
    print('Image path212: $imagePath');
  }

  selectVideo(source) async {
    final ImagePicker picker = ImagePicker();
    video = await picker.pickVideo(source: source);
    print("video.path: ${video!.path}");
    videoName = video!.name;
    // LostDataResponse response = await picker.retrieveLostData();
  }

  setAllItemData(ApiResponce<CategoryModel> response) {
    getAllItemsData = response;
    debugPrint('ItemDatalist got');
    notifyListeners();
  }

  Future<void> postAdItems() async {
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
