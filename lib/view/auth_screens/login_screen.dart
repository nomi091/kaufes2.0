import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kaufes/utils/constants/colors.dart';
import 'package:kaufes/utils/constants/image_paths.dart';
import 'package:provider/provider.dart';

import '../../res/widgets/global_widgets/custom_text_form_field.dart';
import '../../res/widgets/global_widgets/primary_button.dart';
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
  @override
  Widget build(BuildContext context) {
    // AuthViewModel authViewModel = Provider.of<AuthViewModel>(context);
    // authViewModel.getDeviceToken();
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<AuthViewModel>(builder: (context, value, child) {
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: ConstantSize.getHeight(context) * 0.05,
              horizontal: ConstantSize.getWidth(context) * 0.06,
            ),
            child: Form(
              key: authInForm,
              child: Container(
                color: AppColors.snowBackground,
                height: ConstantSize.getHeight(context) * 0.7,
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
                    SizedBox(height: ConstantSize.getHeight(context) * 0.02),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'loginData',
                          style: MyTextStyles.mediumBlack,
                        ).tr()),
                    SizedBox(height: ConstantSize.getHeight(context) * 0.025),

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
                      controller: value.signInEmail,
                      hintText: 'hintEmail'.tr(),
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
                        style: MyTextStyles.subHeadingBoldBlack,
                      ).tr(),
                    ),
                    SizedBox(height: ConstantSize.getHeight(context) * 0.01),
                    CustomTextField(
                      controller: value.signInPassword,
                      hintText: 'hintPassword'.tr(),
                      keyboardType: TextInputType.emailAddress,
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
                    const SizedBox(
                      height: 10,
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                     value.errorMessageLogin.tr(),
                        style: MyTextStyles.errorMessageStyle,
                      ),
                    ),
                    SizedBox(height: ConstantSize.getHeight(context) * 0.02),
                    // Login Button
                    BtnPrimeryBackground(
                      onPressed: () {
                        if (authInForm.currentState!.validate()) {
                          value.loginApi(context);
                        }
                      },
                      title: 'login'.tr(),
                      isLoading: value.authloading,
                      borderRadiusCircular: 4,
                      borderSideWidth: 0.1,
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: AppColors.whiteColor,
                      ),
                      width: double.infinity,
                      height: ConstantSize.getHeight(context) * 0.05,
                      backgroundColor: AppColors.primaryColor,
                      borderColor: AppColors.primaryColor,
                    ),

                    SizedBox(height: ConstantSize.getHeight(context) * 0.01),

                    // Forgot Password Text
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, ScreenRoutes.verifyScreen);
                        },
                        child: Text(
                          'forgotPassword'.tr(),
                          style: MyTextStyles.subHeadingBoldBlack,
                        ),
                      ),
                    ),
                    SizedBox(height: ConstantSize.getHeight(context) * 0.01),

                    // Create Account Text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('doNotAccount').tr(),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              ScreenRoutes.signUp,
                            );
                          },
                          child: const Text(
                            'createAccount',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.secondaryColor,
                            ),
                          ).tr(),
                        ),
                      ],
                    ),

                    SizedBox(height: ConstantSize.getHeight(context) * 0.01),

                    // Login with Text
                    Align(
                      alignment: Alignment.center,
                      child: const Text('loginWith').tr(),
                    ),

                    SizedBox(height: ConstantSize.getHeight(context) * 0.02),

                    // Social Icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          child: SvgPicture.asset(
                            AppImages.svgFacebookIcon,
                            height: 40,
                          ),
                          onTap: () {
                            value.onPressedFacebookLogin();
                          },
                        ),
                        InkWell(
                          onTap: () {
                            value.signInWithGoogle(context);
                          },
                          child: SvgPicture.asset(AppImages.svgGoogleIcon),
                        ),
                        InkWell(
                          child: SvgPicture.asset(
                            AppImages.svgInstagramPrimeryIcon,
                            height: 40,
                          ),
                          onTap: () {
                            value.loginWithInstagram();
                            // context.setLocale(const Locale(
                            //     'en', 'US')); // Change locale to English (en)
                          },
                        ),
                        InkWell(
                          child: Image.asset(
                            AppImages.appleIcon,
                            height: 35,
                          ),
                          onTap: () {
                            value.onPressedAppleLogin(context);
                            // context.setLocale(const Locale('de', 'DE'));
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
