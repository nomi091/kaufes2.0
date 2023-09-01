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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> authInForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // AuthViewModel authViewModel = Provider.of<AuthViewModel>(context);
    // authViewModel.getDeviceToken();
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
                // vertical: ConstantSize.getHeight(context) * 0.11,
                horizontal: ConstantSize.getWidth(context) * 0.06,
              ),
              child: Form(
                key: authInForm,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: ConstantSize.getScaleHeight(context) * 16),

                    // Section Title
                    Container(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'regitration_text',
                        style: MyTextStyles.sectionTitlePrimary,
                      ).tr(),
                    ),
                    SizedBox(height: ConstantSize.getScaleHeight(context) * 16),

                    SizedBox(
                      height: ConstantSize.getScaleHeight(context) * 41,
                      width: ConstantSize.getScaleWidth(context) * 324,
                      child: Text(
                        textAlign: TextAlign.center,
                        'signUpData',
                        style: MyTextStyles.subHeadingCenterMediumBlack,
                      ).tr(),
                    ),
                    SizedBox(height: ConstantSize.getScaleHeight(context) * 24),

                    // Email Field
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'email',
                        style: MyTextStyles.subHeadingBoldBlack,
                      ).tr(),
                    ),
                    SizedBox(height: ConstantSize.getHeight(context) * 0.01),
                    CustomTextField(
                      controller: controller.signUpEmail,
                      hintText: 'hintEmail'.tr(),
                      keyboardType: TextInputType.emailAddress,
                      errorText: controller.emailError == ""
                          ? null
                          : controller.emailError.tr(),
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
                    SizedBox(height: ConstantSize.getScaleHeight(context) * 16),

                    // Password Field
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'password',
                        style: MyTextStyles.subHeadingBoldBlack,
                      ).tr(),
                    ),
                    SizedBox(height: ConstantSize.getHeight(context) * 0.01),
                    CustomTextField(
                      controller: controller.signUpPassword,
                      hintText: 'hintPassword'.tr(),
                      keyboardType: TextInputType.emailAddress,
                      errorText: controller.passwordError == ""
                          ? null
                          : controller.passwordError.tr(),
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
                    SizedBox(height: ConstantSize.getScaleHeight(context) * 16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'confirmPassword'.tr(),
                        style: MyTextStyles.subHeadingBoldBlack,
                      ),
                    ),
                    SizedBox(height: ConstantSize.getHeight(context) * 0.01),

                    CustomTextField(
                      controller: controller.signUpConfirmPassword,
                      hintText: 'enterConfirmPassword'.tr(),
                      keyboardType: TextInputType.emailAddress,
                      //   icon: const Icon(Icons.remove_red_eye_rounded),
                      obscureText: true,
                      validator: (value2) {
                        if (value2!.isEmpty) {
                          return "Confirm_paassword_validation".tr();
                        } else if (value2.length < 8) {
                          return "length_validation".tr();
                        } else if (value2 != controller.signUpPassword.text) {
                          return "equal_validation".tr();
                        }
                        return null;
                      },
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    controller.errorMessageSignUp == ""
                        ? Container()
                        : Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              controller.errorMessageSignUp.tr(),
                              style: MyTextStyles.errorStyleTextField,
                            ),
                          ),
                    SizedBox(height: ConstantSize.getScaleHeight(context) * 20),

                    // Login Button
                    BtnPrimeryBackground(
                      onPressed: () {
                        if (authInForm.currentState!.validate()) {
                          controller.signUpApiResponce(context);
                        }
                      },
                      isLoading: controller.authloading,
                      title: 'signUP'.tr(),
                      borderRadiusCircular: 8,
                      borderSideWidth: 0.1,
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: AppColors.whiteColor,
                      ),
                      width: double.infinity,
                      height: ConstantSize.getScaleHeight(context) * 48,
                      backgroundColor: AppColors.primaryColor,
                      borderColor: AppColors.primaryColor,
                    ),

                    SizedBox(height: ConstantSize.getScaleHeight(context) * 20),
                    // Create Account Text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'already_account',
                          style: MyTextStyles.gotToRegistrationTextStyle,
                        ).tr(),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              ScreenRoutes.logIn,
                            );
                          },
                          child: Text(
                            'login',
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
                            //   value.onPressedFacebookLogin();
                          },
                        ),
                        SizedBox(
                            width: ConstantSize.getScaleWidth(context) * 20.0),
                        InkWell(
                          onTap: () {
                            //       value.signInWithGoogle(context);
                          },
                          child: SvgPicture.asset(
                            AppImages.googleIcon,
                            height: 40,
                          ),
                        ),
                        SizedBox(
                            width: ConstantSize.getScaleWidth(context) *20.0),
                        InkWell(
                          child: SvgPicture.asset(
                            AppImages.appleIcon,
                            height: 40,
                          ),
                          onTap: () {
                            controller.onPressedAppleLogin(context);
                            context.setLocale(const Locale('de', 'DE'));
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                        height: ConstantSize.getScaleHeight(context) * 24.68),
                    SizedBox(
                      height: ConstantSize.getScaleHeight(context) * 41,
                      width: ConstantSize.getScaleWidth(context) * 326,
                      child: Text(
                        textAlign: TextAlign.center,
                        'privay_policy',
                        style: MyTextStyles.regularTextStyle,
                      ).tr(),
                    ),
                  ],
                ),
              ));
        }),
      ),
    );
  }
}
