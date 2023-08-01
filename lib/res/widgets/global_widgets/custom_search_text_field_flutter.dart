import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:kaufes/utils/constants/colors.dart';
class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({Key? key}) : super(key: key);

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}
class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  final List<String> staticSuggestions = [
    'bike',
    'new bike',
    'honda bike',
  ];

  final bool _isFocused = false;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 200,
      child: TypeAheadField<String>(
        textFieldConfiguration: TextFieldConfiguration(
          controller: _textEditingController, // Use the text field controller
          autofocus: false,
          // style: DefaultTextStyle.of(context)
          //     .style
          //     .copyWith(fontStyle: FontStyle.normal),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide(
                color: _isFocused ? AppColors.primaryColor : AppColors.grayColor,
                // width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                // width: 1,
              ),
            ),
            filled: true,
            fillColor: AppColors.whiteColor,
            hintText: 'Search',
            hintStyle: const TextStyle(
              color: Color.fromARGB(255, 107, 105, 105),
              fontStyle: FontStyle.normal,
            ),
            suffixIcon: const Icon(Icons.search,color: AppColors.blackColor,),
          ),
        ),
        suggestionsCallback: (pattern) async {
          return staticSuggestions.where((suggestion) =>
              suggestion.toLowerCase().contains(pattern.toLowerCase()));
        },
        itemBuilder: (context, suggestion) {
          return ListTile(
            title: Text(suggestion),
          );
        },
        onSuggestionSelected: (String suggestion) {
          // Set the value of the text field controller to the selected suggestion
          _textEditingController.text = suggestion;
          // Unfocus the text field
          FocusScope.of(context).requestFocus(FocusNode());
        },
      ),
    );
  }
}
