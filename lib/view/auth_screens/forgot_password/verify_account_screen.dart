import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kaufes/res/widgets/global_widgets/primary_button.dart';
import 'package:kaufes/utils/constants/colors.dart';
import 'package:provider/provider.dart';

import '../../../res/widgets/global_widgets/custom_text_form_field.dart';
import '../../../res/widgets/global_widgets/filter_app_bar.dart';
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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.square(ConstantSize.getHeight(context) * 0.06),
          child: FilterAppBar(
            height: ConstantSize.getHeight(context) * 0.05,
            title: "Forgot Passsoword",
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
                horizontal: size.width * 0.06, vertical: size.height * 0.1),
            child: Container(
              alignment: Alignment.center,
              color: AppColors.snowBackground,
              child: Form(
                key: authInForm,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      AppImages.svgPasswordIcon,
                      color: AppColors.secondaryColor,
                      width: size.width * 0.3,
                      height: size.height * 0.09,
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Text(
                      "Enter Your Email ",
                      style: MyTextStyles.headingSmallBoldPrimary,
                    ).tr(),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    CustomTextField(
                      controller: value.forgotVerificationEmailController,
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
                    SizedBox(
                      height: ConstantSize.getHeight(context) * 0.01,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        value.errorMessageforgotPassword,
                        style: MyTextStyles.errorMessageStyle,
                      ).tr(),
                    ),
                    SizedBox(
                      height: ConstantSize.getHeight(context) * 0.02,
                    ),
                    BtnPrimeryBackground(
                      onPressed: () {
                        if (authInForm.currentState!.validate()) {
                          value.forgotPasswordApiResponce(context);
                        }
                      },
                      isLoading: value.authloading,
                      title: 'Send',
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
