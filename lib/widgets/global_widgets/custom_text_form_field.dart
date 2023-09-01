import 'package:flutter/material.dart';
import 'package:kaufes/utils/constants/colors.dart';
import 'package:kaufes/utils/constants/constant_width.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  final String? errorText;
  final String? hintText;
  final TextEditingController? controller;
  final bool? editable;
  final int? maxLines;
  final int? maxLength;
  final void Function(String)? onChange;
  String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextStyle? hintStyle;
  Color? fillColor;
  bool? obscureText;

  CustomTextField({
    Key? key,
    this.fillColor,
    this.validator,
    required this.maxLines,
    required this.hintText,
    this.maxLength,
    this.errorText,
    this.controller,
    this.editable,
    this.onChange,
    this.hintStyle,
    this.keyboardType,
    this.obscureText = false, // Default value for obscureText
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _TextFromFiledState();
}

class _TextFromFiledState extends State<CustomTextField> {
  bool _obscureText = true;
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: SizedBox(
        child: TextFormField(
          style: MyTextStyles.medium16Black,
          maxLength: widget.maxLength,
          validator: widget.validator,
          maxLines: widget.maxLines,
          enabled: widget.editable,
          keyboardType: widget.keyboardType,
          obscureText: _obscureText && widget.obscureText!,
          
          decoration: InputDecoration(
            hintText: widget.hintText,
            contentPadding: EdgeInsets.fromLTRB(
                20.0,
                ConstantSize.getHeight(context) * .001,
                20.0,
                ConstantSize.getHeight(context) * .001),
            suffixIcon:
                widget.obscureText! && _isFocused ? _buildSuffixIcon() : null,
            counterStyle: const TextStyle(
              height: double.minPositive,
            ),
            errorStyle: MyTextStyles.errorStyleTextField,
            hintStyle:widget.hintStyle ?? MyTextStyles.medium16Black50Op,
            counterText: "",
            fillColor: AppColors.whiteColor,
            filled: true,
            errorText: widget.errorText,
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1.0,
                color: AppColors.redColor,
              ),
              borderRadius: BorderRadius.circular(
                8.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors
                    .primaryColor, // This sets the color to primary when the field is in focus and has an error.
              ),
              borderRadius: BorderRadius.circular(
                8.0,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors
                    .textFiledborderGray, // Set this to the color you want when there's no error
              ),
              borderRadius: BorderRadius.circular(
                8.0,
              ),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors
                    .textFiledborderGray, // Set this to the color you want when there's no error
              ),
              borderRadius: BorderRadius.circular(
                8.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
              ),
              borderRadius: BorderRadius.circular(
                8.0,
              ),
            ),
          ),
          controller: widget.controller,
          onChanged: widget.onChange,
          onTap: () {
            setState(() {
              _isFocused = true;
            });
          },
          onFieldSubmitted: (value) {
            setState(() {
              _isFocused = false;
            });
          },
        ),
      ),
    );
  }

  Widget _buildSuffixIcon() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
      child: Icon(
        _obscureText ? Icons.visibility_off : Icons.visibility,
        color: AppColors.blackColor.withOpacity(0.5),
      ),
    );
  }
}
