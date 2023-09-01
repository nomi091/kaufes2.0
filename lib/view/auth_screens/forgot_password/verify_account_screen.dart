import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kaufes/widgets/global_widgets/primary_button.dart';
import 'package:kaufes/utils/constants/colors.dart';
import 'package:provider/provider.dart';

import '../../../widgets/global_widgets/custom_text_form_field.dart';
import '../../../widgets/global_widgets/filter_app_bar.dart';
import '../../../utils/constants/constant_width.dart';
import '../../../utils/constants/image_paths.dart';
import '../../../view_model/auth_view_model/auth_view_model.dart';

class VerifyAccountScreen extends StatefulWidget {
  const VerifyAccountScreen({super.key});

  @override
  State<VerifyAccountScreen> createState() => _VerifyAccountScreenState();
}

class _VerifyAccountScreenState extends State<VerifyAccountScreen> {
  final GlobalKey<FormState> authInForm = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.square(ConstantSize.getHeight(context) * 0.06),
          child: FilterAppBar(
            height: ConstantSize.getHeight(context) * 0.05,
            title: "Back",
            trailingCheck: false,
            onTapBack: () {
              Navigator.pop(context);
            },
            onTapTrailing: () {
              //    Get.offAndToNamed(MyRoutes.getHomeScreen());
            },
          )),
      body: SingleChildScrollView(
        child: Consumer<AuthViewModel>(builder: (context, value, child) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ConstantSize.getWidth(context) * 0.06,
            ),
            child: Container(
              color: AppColors.snowBackground,
              child: Form(
                key: authInForm,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: ConstantSize.getScaleHeight(context) * 48,
                    ),
                    SvgPicture.asset(
                      AppImages.forgotPasswordIcon,
                    ),
                    SizedBox(
                      height: ConstantSize.getScaleHeight(context) * 32,
                    ),
                    Text(
                      "forgot_password",
                      style: MyTextStyles.semiBold20Primary,
                    ).tr(),
                    SizedBox(
                      height: ConstantSize.getScaleHeight(context) * 16,
                    ),
                    Text(
                      "enter_email",
                      textAlign: TextAlign.center,
                      style: MyTextStyles.medium14gray,
                    ).tr(),
                    SizedBox(
                      height: ConstantSize.getScaleHeight(context) * 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'email',
                        style: MyTextStyles.textFieldHeadings,
                      ).tr(),
                    ),
                    SizedBox(height: ConstantSize.getHeight(context) * 0.01),
                    CustomTextField(
                      controller: value.forgotVerificationEmailController,
                      hintText: 'hintEmail'.tr(),
                      errorText: value.errorMessageforgotPassword == ""
                          ? null
                          : value.errorMessageforgotPassword.tr() ,
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
               
                    SizedBox(
                      height: ConstantSize.getHeight(context) * 0.02,
                    ),
                    BtnPrimeryBackground(
                      onPressed: () {
                        if (authInForm.currentState!.validate()) {
                          value.forgotPasswordApi(context);
                        }
                      },
                      isLoading: value.authloading,
                      title: 'continue'.tr(),
                      borderRadiusCircular: 5,
                      borderSideWidth: 1,
                      textStyle: MyTextStyles.headingxSmallBoldWhite,
                      height: ConstantSize.getHeight(context) * 0.04,
                      width: ConstantSize.getWidth(context) * 0.5,
                      backgroundColor: AppColors.primaryColor,
                      borderColor: AppColors.primaryColor,
                    ),
                    SizedBox(
                      height: ConstantSize.getHeight(context) * 0.02,
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
