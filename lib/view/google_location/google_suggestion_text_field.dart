import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:kaufes/utils/constants/colors.dart';
import 'package:kaufes/utils/constants/constant_width.dart';
import 'package:kaufes/view_model/location_view_model/location_view_model.dart';

class AutocompleteTextField extends StatefulWidget {
  const AutocompleteTextField({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AutocompleteTextFieldState createState() => _AutocompleteTextFieldState();
}

class _AutocompleteTextFieldState extends State<AutocompleteTextField> {
LocationViewModel locationViewModel=LocationViewModel();
  @override
  void dispose() {
    locationViewModel.textEditingController.dispose();
    locationViewModel.focusNode.addListener(() {
      setState(() {
       locationViewModel.isFocused = locationViewModel.focusNode.hasFocus;
      });
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            height: ConstantSize.getHeight(context) * 0.055,
            child: TextField(
              controller:locationViewModel. textEditingController,
              decoration: InputDecoration(
                hintText: 'Search location',
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide(
                    color: locationViewModel.isFocused
                        ? AppColors.primaryColor
                        : AppColors.blackColor,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide:
                      const BorderSide(color: AppColors.primaryColor, width: 1),
                ),
                suffixIcon: const Icon(Icons.location_on,color: AppColors.blackColor,),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: const BorderSide(
                    color: AppColors
                        .blackColor, // Set the unfocused border color to black
                    width: 1,
                  ),
                ),
              ),
              onChanged: (value) async {
                if (value.isNotEmpty) {
                  final response =
                      await locationViewModel. places.findAutocompletePredictions(value);
                  setState(() {
                  locationViewModel.  predictions = response.predictions;
                  });
                } else {
                  setState(() {
                    locationViewModel.predictions =
                        null; // Clear predictions if the text is empty
                  });
                }
              },
            )),
        if (locationViewModel.predictions != null && locationViewModel. predictions!.isNotEmpty)
          ListView.builder(
            shrinkWrap: true,
            itemCount: locationViewModel.predictions!.length,
            itemBuilder: (context, index) {
              final prediction =locationViewModel. predictions![index];
              return ListTile(
                title: Text(prediction.fullText),
                onTap: () {
                  selectPlace(prediction.placeId);
                 locationViewModel. predictions = null;
                },
              );
            },
          ),
      ],
    );
  }

  Future<void> selectPlace(String placeId) async {
    const apiKey =
        "AIzaSyCYMVxfVzS-pEB-DiDl61jzSseZnaA461c"; // Replace with your Google Places API key
    final url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final result = data['result'];

      setState(() {
        final selectedPlace = result['formatted_address'] ?? '';

        locationViewModel.textEditingController.text = selectedPlace;

        final location = result['geometry']['location'];
        final latitude = location['lat'];
        final longitude = location['lng'];
        FocusScope.of(context).unfocus();

        if (kDebugMode) {
          print(latitude);
          print(longitude);
        }
      });
    }
  }
}
