import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_model/auth_view_model/complete_signup_profil_view_model.dart';
import '../../../widgets/global_widgets/custom_text_form_field.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/constant_width.dart';
import '../auth_widget/custom_drop_down.dart';

class DetailProgressScreen1 extends StatefulWidget {
  const DetailProgressScreen1({super.key});

  @override
  State<DetailProgressScreen1> createState() => _DetailProgressScreen1State();
}

bool showOtpField = false;

class _DetailProgressScreen1State extends State<DetailProgressScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        Consumer<SignUpProfileViewModel>(builder: (context, controller, child) {
      return SingleChildScrollView(
        child: Column(
          children: [
            CustomDropdown(
              items: controller.items,
              title: 'salutation'.tr(),
              height: ConstantSize.getScaleHeight(context) * 48,
              onValueChanged: (selectedValue) {
                controller.dropdownValue = selectedValue;
              },
            ),
            SizedBox(
              height: ConstantSize.getScaleHeight(context) * 15,
            ),
            buildCustomTextField(
              controller: controller.userFullNameController,
              title: 'full_name'.tr(),
              errorText: controller.fullNameError == ""
                  ? null
                  : controller.fullNameError.tr(),
              validatorText: 'required'.tr(),
              validatorText2: 'length_min'.tr(),
              hitText: 'full_name'.tr(),
            ),
            SizedBox(
              height: ConstantSize.getScaleHeight(context) * 15,
            ),
            buildCustomTextField(
                controller: controller.userNickNameController,
                title: 'user_name'.tr(),
                errorText: controller.userNameError == ""
                    ? null
                    : controller.userNameError.tr(),
                validatorText: 'required'.tr(),
                validatorText2: 'length_min'.tr(),
                hitText: 'user_name'.tr()),
            SizedBox(
              height: ConstantSize.getScaleHeight(context) * 15,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'birth_date',
                style: MyTextStyles.medium16Black,
              ).tr(),
            ),
            SizedBox(
              height: ConstantSize.getScaleHeight(context) * 15,
            ),
            TextFormField(
              style: MyTextStyles.medium16Black,
              keyboardType: TextInputType.number,
              maxLines: 1,
              onTap: () => controller.openDatePicker(context),
              readOnly: true,
              controller: controller.dateController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "date_time_validator".tr();
                }
                return null;
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(
                    20.0,
                    ConstantSize.getHeight(context) * .001,
                    20.0,
                    ConstantSize.getHeight(context) * .001),
                errorText:
                    controller.dobError == "" ? null : controller.dobError.tr(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                prefixIcon: const Icon(
                  Icons.calendar_month,
                  color: AppColors
                      .primaryColor, // Change the active icon color here
                ),
                hintText: 'DD / MM / YYYY',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      );
    }));
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
            style: MyTextStyles.medium16Black,
          ).tr(),
        ),
        SizedBox(height: ConstantSize.getHeight(context) * 0.02),
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
