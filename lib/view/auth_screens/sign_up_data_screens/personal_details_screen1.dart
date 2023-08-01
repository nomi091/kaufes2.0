import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kaufes/view_model/auth_view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../../../res/widgets/global_widgets/custom_text_form_field.dart';
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
    return Scaffold(
      body: Consumer<AuthViewModel>(builder: (context, language, child) {
        return Consumer<AuthViewModel>(builder: (context, controller, child) {
          return Column(
            children: [
              CustomDropdown(
                items: controller.items,
                title: 'salutation'.tr(),
                height: ConstantSize.getHeight(context) * 0.055,
                onValueChanged: (selectedValue) {
                  controller.dropdownValue = selectedValue;
                },
              ),
              SizedBox(
                height: ConstantSize.getHeight(context) * 0.015,
              ),
              buildCustomTextField(
                  controller: controller.userFullNameController,
                  title: 'full_name'.tr(),
                  validatorText: 'empty_validator'.tr(),
                  hitText: 'full_name'.tr()),
              SizedBox(
                height: ConstantSize.getHeight(context) * 0.015,
              ),
              buildCustomTextField(
                  controller: controller.userNickNameController,
                  title: 'user_name'.tr(),
                  validatorText: 'empty_validator'.tr(),
                  hitText: 'user_name'.tr()),
              SizedBox(
                height: ConstantSize.getHeight(context) * 0.015,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'birth_date',
                  style: MyTextStyles.medimBoldBlack,
                ).tr(),
              ),
              SizedBox(
                height: ConstantSize.getHeight(context) * 0.015,
              ),
              TextFormField(
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
                  hintText: '01 / 01 / 1997',
                ),
              ),
            ],
          );
        });
      }),
    );
  }

  Widget buildCustomTextField({title, hitText, validatorText, controller}) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: MyTextStyles.medimBoldBlack,
          ).tr(),
        ),
        SizedBox(height: ConstantSize.getHeight(context) * 0.02),
        CustomTextField(
          controller: controller,
          hintText: hitText,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value!.isEmpty) {
              return validatorText;
            }
            return null;
          },
          maxLines: 1,
        ),
      ],
    );
  }
}
