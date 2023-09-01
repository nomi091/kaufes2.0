
import 'package:flutter/material.dart';
import 'package:kaufes/utils/constants/constant_width.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../widgets/global_widgets/custom_text_form_field.dart';

Widget buildCustomTextField(
      {context,title, hitText, validatorText, textEditingController, errorText,style,hintStyle}) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: style,
          ),
        ),
        SizedBox(height: ConstantSize.getScaleHeight(context) * 10),
        CustomTextField(
          controller: textEditingController,
          hintText: hitText,
          errorText: errorText,
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          hintStyle:hintStyle ,
          // validator: (value) {
          //   if (value!.isEmpty) {
          //     return validatorText;
          //   }
          //   return null;
          // },
          maxLines: 1,
        ),
      ],
    );
  }