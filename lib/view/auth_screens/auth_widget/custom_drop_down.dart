import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kaufes/utils/constants/colors.dart';
import 'package:kaufes/view_model/auth_view_model/auth_view_model.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final String title;
  final Function(String) onValueChanged;
  // ignore: prefer_typing_uninitialized_variables
  var height;
  CustomDropdown(
      {Key? key,
      required this.items,
      required this.title,
      required this.onValueChanged,
      required this.height})
      : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

AuthViewModel authViewModel = AuthViewModel();

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  void initState() {
    super.initState();
    authViewModel.dropdownValue =
        widget.items[0]; // Default value: 'Select Gender'
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          widget.title,
          style: MyTextStyles.medimBoldBlack,
        ).tr(),
      ),
      const SizedBox(
        height: 10,
      ),
      Container(
        height:widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: AppColors.blackColor.withOpacity(0.5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              menuMaxHeight: 300,
              borderRadius: BorderRadius.circular(20),
              isExpanded: true,
              value: authViewModel.dropdownValue,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                size: 25,
              ),
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontFamily: 'satoshiRegular',
              ),
              items: widget.items.map<DropdownMenuItem<String>>((itemValue) {
                return DropdownMenuItem<String>(
                  value: itemValue,
                  child: Text(
                    itemValue,
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // // setState(() {
                // authViewModel.dropdownValue = newValue!;
                // print(authViewModel.dropdownValue);
                // // });
                // // Pass the selected value back to the calling screen
                widget.onValueChanged(newValue!);
              },
            ),
          ),
        ),
      ),
    ]);
  }
}
