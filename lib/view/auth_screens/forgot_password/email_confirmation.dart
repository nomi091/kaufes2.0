import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kaufes/widgets/global_widgets/primary_button.dart';
import 'package:kaufes/utils/constants/colors.dart';
import 'package:kaufes/utils/constants/image_paths.dart';
import 'package:kaufes/utils/routes/routes.dart';
import 'package:provider/provider.dart';

import '../../../view_model/auth_view_model/complete_signup_profil_view_model.dart';
import '../../../widgets/global_widgets/filter_app_bar.dart';
import '../../../utils/constants/constant_width.dart';
import '../../../view_model/auth_view_model/auth_view_model.dart';

class EmailConfirmationScreen extends StatefulWidget {
  const EmailConfirmationScreen({super.key});

  @override
  State<EmailConfirmationScreen> createState() =>
      _EmailConfirmationScreenState();
}


class _EmailConfirmationScreenState extends State<EmailConfirmationScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // You can use the context here
      final profileController = Provider.of<SignUpProfileViewModel>(context, listen: false);
      profileController.getProfileData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.square(ConstantSize.getHeight(context) * 0.06),
          child: FilterAppBar(
            height: ConstantSize.getHeight(context) * 0.05,
            title: "Email",
            trailingCheck: false,
            onTapBack: () {
              Navigator.pushNamed(context, ScreenRoutes.logIn);
            },
            onTapTrailing: () {
              //    Get.offAndToNamed(MyRoutes.getHomeScreen());
            },
          )),
      body: SingleChildScrollView(
        child: WillPopScope(
          onWillPop: () async {
            Navigator.pushNamed(context, ScreenRoutes.logIn);
            return true;
          },
          child: Consumer<SignUpProfileViewModel>(builder: (context, value, child) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0, vertical: size.height * 0.1),
              child: Container(
                alignment: Alignment.center,
                color: AppColors.snowBackground,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      AppImages.trustedIcon,
                      width: size.width * 0.3,
                      height: size.height * 0.09,
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Text(
                      "check_email",
                      style: MyTextStyles.headingSmallBoldPrimary,
                    ).tr(),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.08,
                          vertical: size.height * 0.0),
                      child: Text(
                        "dummy_text",
                        style: MyTextStyles.mediumBlack,
                      ).tr(),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    // OtpTextField(
                    //   numberOfFields: 6,
                    //   borderColor: const Color(0xFF512DA8),
                    //   //set to true to show as box or false to show as dash
                    //   showFieldAsBox: true,
                    //   cursorColor: Colors.white,
                    //   fillColor: Colors.white,
                    //   fieldWidth: size.width * 0.13,
                    //   focusedBorderColor: AppColors.primaryColor,
                    //   //runs when a code is typed in
                    //   //runs when every textfield is filled
                    //   onSubmit: (String verificationCode) {
                    //     value.emailOtpController.text =
                    //         verificationCode;                 
                    //    value.emailVerificatonApiResponce(context);
                    //   }, // end onSubmit
                    // ),
                    // SizedBox(
                    //   height: ConstantSize.getHeight(context) * 0.02,
                    // ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.08,
                          vertical: size.height * 0.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          value.emailMessage,
                          style: MyTextStyles.errorMessageStyle,
                        ).tr(),
                      ),
                    ),
                    SizedBox(
                      height: ConstantSize.getHeight(context) * 0.02,
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: BtnPrimeryBackground(
                        onPressed: () {
                          Navigator.pushNamed(context,ScreenRoutes.logIn);
                        },
                        isLoading: value.authloading,
                        title: 'login',
                        borderRadiusCircular: 5,
                        borderSideWidth: 1,
                        textStyle: MyTextStyles.headingxSmallBoldWhite,
                        height: ConstantSize.getHeight(context) * 0.04,
                        width: ConstantSize.getWidth(context) * 0.3,
                        backgroundColor: AppColors.primaryColor,
                        borderColor: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: ConstantSize.getHeight(context) * 0.02,
                    ),
            
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
