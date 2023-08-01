
  import 'package:flutter/material.dart';
import 'package:kaufes/utils/constants/constant_width.dart';

import '../../../res/widgets/global_widgets/primary_button.dart';
import '../../../utils/constants/colors.dart';

Widget buildNextButton({BuildContext? context,  Function? buttonPressed,}
 ) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: BtnPrimeryBackground(
        onPressed:buttonPressed as void Function(),
        title: 'Next',
        borderRadiusCircular: 5,
        borderSideWidth: 1,
        textStyle: MyTextStyles.headingxSmallBoldWhite,
        height: ConstantSize.getHeight(context!) * 0.061,
        width:  ConstantSize.getWidth(context)  * 0.9,
        backgroundColor: AppColors.primaryColor,
        borderColor: AppColors.primaryColor,
      ),
    );
  }