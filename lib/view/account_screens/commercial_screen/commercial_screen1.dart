import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/constant_width.dart';
import '../../../view_model/account_view_model/account_view_model.dart';
import '../../../widgets/global_widgets/custom_text_form_field.dart';
import '../../../widgets/global_widgets/filter_app_bar.dart';
import '../../../widgets/global_widgets/primary_button.dart';

class CommercialScreen2 extends StatefulWidget {
  const CommercialScreen2({super.key});

  @override
  State<CommercialScreen2> createState() => _CommercialScreen2State();
}

class _CommercialScreen2State extends State<CommercialScreen2> {
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
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ConstantSize.getWidth(context) * 0.06,
        ),
        child:
            Consumer<AccountViewModel>(builder: (context, controller, child) {
          return SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: ConstantSize.getScaleHeight(context) * 24),
                  Text(
                    'Upgrade to',
                    style: MyTextStyles.medium21Primary,
                  ),
                  SizedBox(height: ConstantSize.getScaleHeight(context) * 10),
                  Text(
                    'Commercial Seller',
                    style: MyTextStyles.medium21Secondary,
                  ),
                  SizedBox(height: ConstantSize.getScaleHeight(context) * 10),
                  Text(
                    'dummy_text'.tr(),
                    style: MyTextStyles.regular16Black,
                  ),
                  SizedBox(height: ConstantSize.getScaleHeight(context) * 25),
                  buildCustomTextField(
                    controller: controller.firstnameController,
                    title: 'Firmenname'.tr(),
                    // errorText: controller.fullNameError == ""
                    //     ? null
                    //     : controller.fullNameError.tr(),
                    validatorText: 'Firemenname Required'.tr(),
                    validatorText2: 'length_min'.tr(),
                    hitText: 'Enter Firemenname'.tr(),
                  ),
                  SizedBox(height: ConstantSize.getScaleHeight(context) * 25),
                  buildCustomTextField(
                    controller: controller.firstnameController,
                    title: 'Firma Number'.tr(),
                    // errorText: controller.fullNameError == ""
                    //     ? null
                    //     : controller.fullNameError.tr(),
                    validatorText: 'required'.tr(),
                    validatorText2: 'length_min'.tr(),
                    hitText: 'Enter Firma Number'.tr(),
                  ),
                  SizedBox(height: ConstantSize.getScaleHeight(context) * 25),
                  buildCustomTextField(
                    controller: controller.firstnameController,
                    title: 'Website-Link (optional)'.tr(),
                    // errorText: controller.fullNameError == ""
                    //     ? null
                    //     : controller.fullNameError.tr(),
                    validatorText: 'required'.tr(),
                    validatorText2: 'length_min'.tr(),
                    hitText: 'Enter Website-Link'.tr(),
                  ),
                  SizedBox(height: ConstantSize.getScaleHeight(context) * 25),
                  buildCustomTextField(
                    controller: controller.firstnameController,
                    title: 'texation Number'.tr(),
                    // errorText: controller.fullNameError == ""
                    //     ? null
                    //     : controller.fullNameError.tr(),
                    validatorText: 'required'.tr(),
                    validatorText2: 'length_min'.tr(),
                    hitText: 'Enter Texation Number'.tr(),
                  ),
                  SizedBox(height: ConstantSize.getScaleHeight(context) * 25),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Upload Logo (Optional)",
                      style: MyTextStyles.medium14gray,
                    ).tr(),
                  ),
                  SizedBox(height: ConstantSize.getScaleHeight(context) * 10),
                  DottedBorder(
                    color: Colors.black, // Color of the dotted border
                    strokeWidth: 1, // Width of the dotted border
                    radius: const Radius.circular(8),
                    borderType: BorderType.RRect,
                    dashPattern: const [3, 5],
                    child: SizedBox(
                      height: ConstantSize.getScaleHeight(context) * 139,
                      width: ConstantSize.getWidth(context) * 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.image,
                            size: 38,
                            color: AppColors.grayColor,
                          ),
                          const SizedBox(height: 10),
                          Text('Click to Upload',
                              style: MyTextStyles.regular14Black),
                          const SizedBox(height: 10),
                          Text('JPG, PNG Max size 10MB',
                              style: MyTextStyles.regular12gray),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: ConstantSize.getScaleHeight(context) * 25),
                  BtnPrimeryBackground(
                    onPressed: () {
                      // Navigator.pushNamed(
                      //     context, ScreenRoutes.commercialScreen2);
                    },
                    title: 'Submit'.tr(),
                    // isLoading: controller.authloading,
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
                  SizedBox(height: ConstantSize.getScaleHeight(context) * 24),
                  BtnPrimeryBackground(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    title: 'Back'.tr(),
                    borderRadiusCircular: 8,
                    borderSideWidth: 0.1,
                    textStyle:
                        const TextStyle(fontSize: 16, color: Colors.black),
                    width: double.infinity,
                    height: ConstantSize.getScaleHeight(context) * 48.0,
                    backgroundColor: AppColors.whiteColor,
                    borderColor: AppColors.grayColor,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ]),
          );
        }),
      ),
    );
  }

  Widget buildCustomTextField({
    title,
    hitText,
    validatorText,
    controller,
    validatorText2,
    errorText,
  }) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: MyTextStyles.medium14gray,
          ).tr(),
        ),
        SizedBox(height: ConstantSize.getScaleHeight(context) * 10),
        CustomTextField(
          controller: controller,
          hintText: hitText,
          errorText: errorText,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value!.isEmpty) {
              return validatorText;
            }
            if (value.length < 6) {
              return validatorText2;
            }
            return null;
          },
          maxLines: 1,
        ),
      ],
    );
  }
}
