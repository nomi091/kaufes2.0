
  import 'package:flutter/material.dart';
import 'package:kaufes/utils/constants/constant_width.dart';
import 'package:kaufes/view/home_screens/notifications_screen/notfications.dart';

import '../../../res/widgets/global_widgets/primary_button.dart';
import '../../../utils/constants/colors.dart';

Widget buildCustomButton({BuildContext? context,  Function? buttonPressed,title,isLoading}
 ) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: BtnPrimeryBackground(
        onPressed:buttonPressed as void Function(),
        title: title,
        borderRadiusCircular: 5,
        borderSideWidth: 1,
        isLoading: isLoading,
        textStyle: MyTextStyles.headingxSmallBoldWhite,
        height: ConstantSize.getHeight(context!) * 0.05,
        width:  ConstantSize.getWidth(context)  * 0.9,
        backgroundColor: AppColors.primaryColor,
        borderColor: AppColors.primaryColor,
      ),
    );
  }
  Widget buildCustomButton2({BuildContext? context,  Function? buttonPressed,title,isLoading}
 ) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: BtnPrimeryBackground(
        onPressed:buttonPressed as void Function(),
        title: title,
        borderRadiusCircular: 5,
        isLoading: isLoading,
        borderSideWidth: 1,
        textStyle: MyTextStyles.boldDetailGrey,
        height: ConstantSize.getHeight(context!) * 0.05,
        width:  ConstantSize.getWidth(context)  * 0.9,
        backgroundColor: AppColors.whiteColor,
        borderColor: AppColors.blackColor.withOpacity(0.3),
      ),
    );
  }