// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:kaufes/res/widgets/global_widgets/primary_button.dart';
// import 'package:kaufes/utils/constants/colors.dart';
// import 'package:provider/provider.dart';

// import '../../res/widgets/global_widgets/custom_text_form_field.dart';
// import '../../res/widgets/global_widgets/filter_app_bar.dart';
// import '../../utils/constants/constant_width.dart';
// import '../../utils/constants/image_paths.dart';
// import '../../view_model/auth_view_model/auth_view_model.dart';

// class ResetPasswordScreen extends StatefulWidget {
//   const ResetPasswordScreen({super.key});

//   @override
//   State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
// }

// class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
//   final GlobalKey<FormState> authInForm = GlobalKey<FormState>();

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: PreferredSize(
//           preferredSize: Size.square(ConstantSize.getHeight(context) * 0.06),
//           child: FilterAppBar(
//             height: ConstantSize.getHeight(context) * 0.05,
//             title: "Reset Passsoword",
//             trailingCheck: false,
//             onTapBack: () {
//               Navigator.pop(context);
//             },
//             onTapTrailing: () {
//               //    Get.offAndToNamed(MyRoutes.getHomeScreen());
//             },
//           )),
//       body: SingleChildScrollView(
//         child: Consumer<AuthViewModel>(builder: (context, value, child) {
//           return Padding(
//             padding: EdgeInsets.symmetric(
//                 horizontal: size.width * 0.06, vertical: size.height * 0.1),
//             child: Form(
//               key: authInForm,
//               child: Container(
//                 alignment: Alignment.center,
//                 color: AppColors.snowBackground,
//                 child: Column(
//                   children: [
//                     SvgPicture.asset(
//                       AppImages.svgPasswordIcon,
//                       color: AppColors.secondaryColor,
//                       width: size.width * 0.3,
//                       height: size.height * 0.09,
//                     ),
//                     SizedBox(
//                       height: size.height * 0.03,
//                     ),
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         'old_password'.tr(),
//                         style: MyTextStyles.subHeadingBoldBlack,
//                       ),
//                     ),
//                     SizedBox(height: ConstantSize.getHeight(context) * 0.01),

//                     CustomTextField(
//                       controller: value.oldPasswordTextEditingController,
//                       hintText: 'old_password'.tr(),
//                       keyboardType: TextInputType.emailAddress,
//                       //   icon: const Icon(Icons.remove_red_eye_rounded),
//                       obscureText: true,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "old_password_validate".tr();
//                         } else if (value.length < 8) {
//                           return "length_validation".tr();
//                         }
//                         return null;
//                       },
//                       maxLines: 1,
//                     ),
//                     SizedBox(height: ConstantSize.getHeight(context) * 0.01),
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         'new_password'.tr(),
//                         style: MyTextStyles.subHeadingBoldBlack,
//                       ),
//                     ),
//                     SizedBox(height: ConstantSize.getHeight(context) * 0.01),

//                     CustomTextField(
//                       controller: value.newPasswordTextEditingController,
//                       hintText: 'new_password'.tr(),
//                       keyboardType: TextInputType.emailAddress,
//                       //   icon: const Icon(Icons.remove_red_eye_rounded),
//                       obscureText: true,
//                       validator: (value2) {
//                         if (value2!.isEmpty) {
//                           return "new_password_validate".tr();
//                         } else if (value2.length < 8) {
//                           return "length_validation".tr();
//                         }
//                         return null;
//                       },
//                       maxLines: 1,
//                     ),
//                     SizedBox(height: ConstantSize.getHeight(context) * 0.01),
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         'confirmPassword'.tr(),
//                         style: MyTextStyles.subHeadingBoldBlack,
//                       ),
//                     ),
//                     SizedBox(height: ConstantSize.getHeight(context) * 0.01),

//                     CustomTextField(
//                       controller: value.confirmPasswordTextEditingController,
//                       hintText: 'confirmPassword'.tr(),
//                       keyboardType: TextInputType.emailAddress,
//                       //   icon: const Icon(Icons.remove_red_eye_rounded),
//                       obscureText: true,
//                       validator: (value2) {
//                         if (value2!.isEmpty) {
//                           return "Confirm_paassword_validation".tr();
//                         } else if (value2 !=
//                             value.newPasswordTextEditingController.text) {
//                           return "equal_validation".tr();
//                         } else if (value2.length < 8) {
//                           return "length_validation".tr();
//                         }
//                         return null;
//                       },
//                       maxLines: 1,
//                     ),
//                     SizedBox(
//                       height: ConstantSize.getHeight(context) * 0.02,
//                     ),
//                     BtnPrimeryBackground(
//                       onPressed: () {
//                         if (authInForm.currentState!.validate()) {
//                           value.resetPasswordApiResponce(context);
//                         }
//                       },
//                       isLoading: value.authloading,
//                       title: 'update_password'.tr(),
//                       borderRadiusCircular: 5,
//                       borderSideWidth: 1,
//                       textStyle: MyTextStyles.headingxSmallBoldWhite,
//                       height: ConstantSize.getHeight(context) * 0.04,
//                       width: ConstantSize.getWidth(context) * 0.5,
//                       backgroundColor: AppColors.primaryColor,
//                       borderColor: AppColors.primaryColor,
//                     ),
//                     SizedBox(
//                       height: ConstantSize.getHeight(context) * 0.02,
//                     ),
//                     // buildCustomButton(
//                     //     context: context,
//                     //     isLoading: value.authloading,
//                     //     buttonPressed: () {
//                     //       Navigator.pushNamed(
//                     //           context, ScreenRoutes.detailProgressScreen);
//                     //     },
//                     //     title: 'verify_email'.tr())
//                   ],
//                 ),
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kaufes/utils/routes/routes.dart';

import '../../../res/widgets/global_widgets/filter_app_bar.dart';
import '../../../res/widgets/global_widgets/primary_button.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/constant_width.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.square(ConstantSize.getHeight(context) * 0.06),
          child: FilterAppBar(
            height: ConstantSize.getHeight(context) * 0.05,
            title: "Reset Passsoword",
            trailingCheck: false,
            onTapBack: () {
              Navigator.pop(context);
            },
            onTapTrailing: () {
              //    Get.offAndToNamed(MyRoutes.getHomeScreen());
            },
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.email,
              size: 50,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'We have sent you an email to update your password.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: ConstantSize.getWidth(context)*0.2),
              child: BtnPrimeryBackground(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, ScreenRoutes.logIn, (route) => false);
                },
                title: 'login'.tr(),
                isLoading: false,
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
            ),
          ],
        ),
      ),
    );
  }
}
