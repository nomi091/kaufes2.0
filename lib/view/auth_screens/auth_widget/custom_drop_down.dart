import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kaufes/utils/constants/colors.dart';

import '../../../view_model/auth_view_model/complete_signup_profil_view_model.dart';

// ignore: must_be_immutable
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

SignUpProfileViewModel signUpProfileViewModel = SignUpProfileViewModel();

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Column(children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.title,
            style: MyTextStyles.medium16Black,
          ).tr(),
        ),
      widget. title==""? const SizedBox(
          height: 0,
        ):const SizedBox(
          height: 10,
        ),
        Container(
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: AppColors.blackColor.withOpacity(0.5),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                menuMaxHeight: 300,
                borderRadius: BorderRadius.circular(20),
                isExpanded: true,
                value: signUpProfileViewModel.dropdownValue,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 25,
                  color: AppColors.blackColor,
                ),
                style: MyTextStyles.medium16Black50Op,
                items: widget.items.map<DropdownMenuItem<String>>((itemValue) {
                  return DropdownMenuItem<String>(
                    value: itemValue,
                    child: Text(
                      itemValue,
                      style: MyTextStyles.medium16Black,
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  widget.onValueChanged(newValue!);
                  signUpProfileViewModel.dropdownValue = newValue;
                  setState(() {});
                },
              ),
            ),
          ),
        ),
      ]);
    });
  }
}
