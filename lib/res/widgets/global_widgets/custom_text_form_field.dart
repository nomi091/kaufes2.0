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
    //    height: ConstantSize.getHeight(context) * 0.07,
        child: TextFormField(
          maxLength: widget.maxLength,
          validator: widget.validator,
          maxLines: widget.maxLines,
          enabled: widget.editable,
          keyboardType: widget.keyboardType,
          obscureText: _obscureText && widget.obscureText!,
          decoration: InputDecoration(
            hintText: widget.hintText,
              contentPadding: EdgeInsets.fromLTRB(20.0, ConstantSize.getHeight(context) * .001, 20.0, ConstantSize.getHeight(context)  * .001),
            suffixIcon:
                widget.obscureText! && _isFocused ? _buildSuffixIcon() : null,
            // Rest of the InputDecoration properties...
            counterStyle: const TextStyle(
              height: double.minPositive,
            ),
            counterText: "",
            //fillColor: widget.fillColor,
            fillColor: AppColors.whiteColor,
            filled: true,
            errorText: widget.errorText,
            
            disabledBorder: InputBorder.none,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                5.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
              ),
              borderRadius: BorderRadius.circular(
                5.0,
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
        color: AppColors.grayColor,
      ),
    );
  }
}
