import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kaufes/utils/constants/colors.dart';
import 'package:kaufes/utils/constants/image_paths.dart';
import 'package:provider/provider.dart';

import '../../widgets/global_widgets/custom_text_form_field.dart';
import '../../widgets/global_widgets/filter_app_bar.dart';
import '../../widgets/global_widgets/primary_button.dart';
import '../../utils/constants/constant_width.dart';
import '../../utils/routes/routes.dart';
import '../../view_model/auth_view_model/auth_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> authInForm = GlobalKey<FormState>();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FilterAppBar(
        onTapTrailing: () {},
        onTapBack: () {
          Navigator.pop(context);
        },
        height: ConstantSize.getHeight(context) * 0.05,
        title: 'Back'.tr(),
        subTitle: '',
        trailingCheck: false,
      ),
      backgroundColor: AppColors.snowBackground,
      body: SingleChildScrollView(
        child: Consumer<AuthViewModel>(builder: (context, controller, child) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ConstantSize.getWidth(context) * 0.06,
            ),
            child: Form(
              key: authInForm,
              child: SizedBox(
                height: ConstantSize.getHeight(context) * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Section Title
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'login',
                        style: MyTextStyles.sectionTitlePrimary,
                      ).tr(),
                    ),
                    SizedBox(
                      height: ConstantSize.getScaleHeight(context) * 16.0,
                    ),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'loginData',
                          style: MyTextStyles.subHeadingBoldBlack,
                        ).tr()),
                    SizedBox(
                      height: ConstantSize.getScaleHeight(context) * 24.0,
                    ),

                    // Email Field
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'email',
                        style: MyTextStyles.textFieldHeadings,
                      ).tr(),
                    ),
                    SizedBox(height: ConstantSize.getHeight(context) * 0.01),
                    CustomTextField(
                      controller: controller.signInEmail,
                      hintText: 'hintEmail'.tr(),
                      errorText: controller.emailError == ""
                          ? null
                          : controller.emailError,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'email_required'.tr();
                        } else if (!value.contains('@')) {
                          return 'invalid_email'.tr();
                        }
                        return null;
                      },
                      maxLines: 1,
                    ),
                    SizedBox(height: ConstantSize.getHeight(context) * 0.025),

                    // Password Field
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'password',
                        style: MyTextStyles.textFieldHeadings,
                      ).tr(),
                    ),
                    SizedBox(height: ConstantSize.getHeight(context) * 0.01),
                    CustomTextField(
                      controller: controller.signInPassword,
                      hintText: 'hintPassword'.tr(),
                      keyboardType: TextInputType.emailAddress,
                      errorText: controller.passwordError == ""
                          ? null
                          : controller.passwordError,
                      //   icon: const Icon(Icons.remove_red_eye_rounded),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "passwrord_required".tr();
                        } else if (value.length < 8) {
                          return "length_validation".tr();
                        }
                        return null;
                      },
                      maxLines: 1,
                    ),
                    controller.errorMessageLogin == ""
                        ? Container()
                        : Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              controller.errorMessageLogin.tr(),
                              style: MyTextStyles.errorStyleTextField,
                            ),
                          ),
                    SizedBox(
                      height: ConstantSize.getScaleHeight(context) * 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    2.0), // Set the desired border radius
                              ),
                              side: const BorderSide(
                                  color: AppColors.primaryColor),
                              activeColor: AppColors.primaryColor,
                              checkColor: AppColors.whiteColor,
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Text(
                              'stay_login'.tr(),
                              style: MyTextStyles.subHeadingBoldBlack,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, ScreenRoutes.verifyScreen);
                          },
                          child: SizedBox(
                            width: 120,
                            child: Text(
                              'forgotPassword'.tr(),
                              overflow: TextOverflow.ellipsis,
                              style: MyTextStyles.subHeadingBoldBlack,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: ConstantSize.getScaleHeight(context) * 10),

                    // Login Button
                    BtnPrimeryBackground(
                      onPressed: () {
                      Navigator.pushNamed(context,ScreenRoutes.bottomNavBar);
                        if (authInForm.currentState!.validate()) {
                          controller.loginApi(context);
                        }
                      },
                      title: 'login'.tr(),
                      isLoading: controller.authloading,
                      borderRadiusCircular: 8,
                      borderSideWidth: 0.1,
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: AppColors.whiteColor,
                      ),
                      width: double.infinity,
                      height: ConstantSize.getScaleHeight(context) * 48.0,
                      backgroundColor: AppColors.primaryColor,
                      borderColor: AppColors.primaryColor,
                    ),

                    SizedBox(height: ConstantSize.getScaleHeight(context) * 32),

                    // Create Account Text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'doNotAccount',
                          style: MyTextStyles.gotToRegistrationTextStyle,
                        ).tr(),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              ScreenRoutes.signUp,
                            );
                          },
                          child: Text(
                            'createAccount',
                            style: MyTextStyles.loginTextStyle,
                          ).tr(),
                        ),
                      ],
                    ),

                    SizedBox(
                        height: ConstantSize.getScaleHeight(context) * 16.32),
                    // Login with Text
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'loginWith',
                        style: MyTextStyles.liteGrayTextStyle,
                      ).tr(),
                    ),

                    SizedBox(
                        height: ConstantSize.getScaleHeight(context) * 10.0),

                    // Social Icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          child: SvgPicture.asset(
                            AppImages.facebookIcon,
                            height: 40,
                          ),
                          onTap: () {
                               controller.onPressedFacebookLogin(context);
                          },
                        ),
                        SizedBox(
                            width: ConstantSize.getScaleWidth(context) * 20.0),
                        InkWell(
                          onTap: () {
                            controller.onPressedGoogleLogin(context);
                          },
                          child: SvgPicture.asset(
                            AppImages.googleIcon,
                            height: 40,
                          ),
                        ),
                        SizedBox(
                            width: ConstantSize.getScaleWidth(context) * 20.0),
                        InkWell(
                          child: SvgPicture.asset(
                            AppImages.appleIcon,
                            height: 40,
                          ),
                          onTap: () {
                            controller.onPressedAppleLogin(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
