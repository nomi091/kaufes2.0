import 'package:flutter/material.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';

class LocationViewModel extends ChangeNotifier {
  final FocusNode focusNode = FocusNode();

  final places =
      FlutterGooglePlacesSdk("AIzaSyCYMVxfVzS-pEB-DiDl61jzSseZnaA461c");
  List<AutocompletePrediction>? predictions;
  TextEditingController textEditingController = TextEditingController();
  bool isFocused = false;
}
