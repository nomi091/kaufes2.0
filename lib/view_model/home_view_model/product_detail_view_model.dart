import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

class ProductDetailModel extends ChangeNotifier {
  CarouselController carouselController = CarouselController();
  List<String> sliderImages = [
    'https://cdn.pixabay.com/photo/2019/07/07/14/03/fiat-500-4322521_1280.jpg',
  ];
  int activePage = 1;
  var isadvertType = "Bid";
}
