import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/constant_width.dart';
import '../../../view_model/account_view_model/account_view_model.dart';
import '../../../widgets/global_widgets/custom_devider.dart';
import '../../../widgets/global_widgets/custom_text_form_field.dart';
import '../../../widgets/global_widgets/filter_app_bar.dart';
import '../../../widgets/global_widgets/primary_button.dart';
import '../../auth_screens/auth_widget/custom_drop_down.dart';

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({super.key});

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
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
          return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: ConstantSize.getScaleHeight(context) * 24),
                Text(
                  'Personal Details',
                  style: MyTextStyles.medium21Primary,
                ),
                SizedBox(height: ConstantSize.getScaleHeight(context) * 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'salutation'.tr(),
                      style: MyTextStyles.regular14gray,
                    ),
                    controller.fullName == false && controller.dob == false
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                controller.salutation = !controller.salutation;
                              });
                            },
                            child: controller.salutation
                                ? Text('Cancel'.tr(),
                                    style: MyTextStyles.medium14Red)
                                : Text('Edit'.tr(),
                                    style: MyTextStyles.medium14Black))
                        : Text('Edit'.tr(),
                            style: controller.fullName == false &&
                                    controller.dob == false
                                ? MyTextStyles.medium14Black
                                : MyTextStyles.regular14gray)
                  ],
                ),
                SizedBox(height: ConstantSize.getScaleHeight(context) * 10),
                controller.salutation
                    ? Visibility(
                        visible: controller.salutation,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomDropdown(
                              items: controller.items,
                              title: ''.tr(),
                              height: ConstantSize.getScaleHeight(context) * 48,
                              onValueChanged: (selectedValue) {
                                controller.dropdownValue = selectedValue;
                              },
                            ),
                            SizedBox(
                                height:
                                    ConstantSize.getScaleHeight(context) * 16),
                            BtnPrimeryBackground(
                              onPressed: () {
                                // Navigator.pushNamed(
                                //     context, ScreenRoutes.bottomNavBar);
                                // if (authInForm.currentState!.validate()) {
                                //   controller.loginApi(context);
                                // }
                              },
                              title: 'Save'.tr(),
                              isLoading: false,
                              borderRadiusCircular: 8,
                              borderSideWidth: 0.1,
                              textStyle: MyTextStyles.medium16white,
                              width: ConstantSize.getScaleWidth(context) * 88.0,
                              height:
                                  ConstantSize.getScaleHeight(context) * 48.0,
                              backgroundColor: AppColors.primaryColor,
                              borderColor: AppColors.primaryColor,
                            ),
                          ],
                        ))
                    : Text(controller.dropdownValue.tr(),
                        style: controller.fullName == false &&
                                controller.dob == false
                            ? MyTextStyles.medium14Black
                            : MyTextStyles.regular14gray),
                SizedBox(height: ConstantSize.getScaleHeight(context) * 16),
                const CustomDivider(
                  indent: 0.0,
                  endIndent: 0.0,
                  color: AppColors.deviderColor,
                ),
                SizedBox(height: ConstantSize.getScaleHeight(context) * 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('full_name'.tr(), style: MyTextStyles.regular14gray),
                    controller.salutation == false && controller.dob == false
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                controller.fullName = !controller.fullName;
                              });
                            },
                            child: controller.fullName
                                ? Text('Cancel'.tr(),
                                    style: MyTextStyles.medium14Red)
                                : Text('Edit'.tr(),
                                    style: MyTextStyles.medium14Black))
                        : Text('Edit'.tr(),
                            style: controller.salutation == false &&
                                    controller.dob == false
                                ? MyTextStyles.medium14Black
                                : MyTextStyles.regular14gray)
                  ],
                ),
                SizedBox(height: ConstantSize.getScaleHeight(context) * 10),
                controller.fullName
                    ? Visibility(
                        visible: controller.fullName,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextField(
                              controller: controller.fullNameController,
                              hintText: 'Ahmad Rahal',
                              // errorText: controller.emailError == ""
                              //     ? null
                              //     : controller.emailError,
                              keyboardType: TextInputType.name,
                              // validator: (value) {
                              //   if (value!.isEmpty) {
                              //     return 'email_required'.tr();
                              //   } else if (!value.contains('@')) {
                              //     return 'invalid_email'.tr();
                              //   }
                              //   return null;
                              // },
                              maxLines: 1,
                            ),
                            SizedBox(
                                height:
                                    ConstantSize.getScaleHeight(context) * 16),
                            BtnPrimeryBackground(
                              onPressed: () {
                                // Navigator.pushNamed(
                                //     context, ScreenRoutes.bottomNavBar);
                                // if (authInForm.currentState!.validate()) {
                                //   controller.loginApi(context);
                                // }
                              },
                              title: 'Save'.tr(),
                              isLoading: false,
                              borderRadiusCircular: 8,
                              borderSideWidth: 0.1,
                              textStyle: MyTextStyles.medium16white,
                              width: ConstantSize.getScaleWidth(context) * 88.0,
                              height:
                                  ConstantSize.getScaleHeight(context) * 48.0,
                              backgroundColor: AppColors.primaryColor,
                              borderColor: AppColors.primaryColor,
                            )
                          ],
                        ),
                      )
                    : Text('Ahmad Rahal',
                        style: controller.salutation == false &&
                                controller.dob == false
                            ? MyTextStyles.medium14Black
                            : MyTextStyles.regular14gray),
                SizedBox(height: ConstantSize.getScaleHeight(context) * 16),
                const CustomDivider(
                  indent: 0.0,
                  endIndent: 0.0,
                  color: AppColors.deviderColor,
                ),
                SizedBox(height: ConstantSize.getScaleHeight(context) * 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('birth_date'.tr(), style: MyTextStyles.regular14gray),
                    controller.salutation == false &&
                            controller.fullName == false
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                controller.dob = !controller.dob;
                              });
                            },
                            child: controller.dob
                                ? Text('Cancel'.tr(),
                                    style: MyTextStyles.medium14Red)
                                : Text('Edit'.tr(),
                                    style: MyTextStyles.medium14Black))
                        : Text('Edit'.tr(),
                            style: controller.salutation == false &&
                                    controller.fullName == false
                                ? MyTextStyles.medium14Black
                                : MyTextStyles.regular14gray)
                  ],
                ),
                SizedBox(height: ConstantSize.getScaleHeight(context) * 10),
                controller.dob
                    ? Visibility(
                        visible: controller.dob,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                // errorText: controller.dobError == ""
                                //     ? null
                                //     : controller.dobError.tr(),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColors.primaryColor),
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
                            SizedBox(
                                height:
                                    ConstantSize.getScaleHeight(context) * 16),
                            BtnPrimeryBackground(
                              onPressed: () {
                                // Navigator.pushNamed(
                                //     context, ScreenRoutes.bottomNavBar);
                                // if (authInForm.currentState!.validate()) {
                                //   controller.loginApi(context);
                                // }
                              },
                              title: 'Save'.tr(),
                              isLoading: false,
                              borderRadiusCircular: 8,
                              borderSideWidth: 0.1,
                              textStyle: MyTextStyles.medium16white,
                              width: ConstantSize.getScaleWidth(context) * 88.0,
                              height:
                                  ConstantSize.getScaleHeight(context) * 48.0,
                              backgroundColor: AppColors.primaryColor,
                              borderColor: AppColors.primaryColor,
                            )
                          ],
                        ),
                      )
                    : Text(controller.dateController.text.tr(),
                        style: controller.salutation == false &&
                                controller.fullName == false
                            ? MyTextStyles.medium14Black
                            : MyTextStyles.regular14gray),
                SizedBox(height: ConstantSize.getScaleHeight(context) * 16),
                const CustomDivider(
                  indent: 0.0,
                  endIndent: 0.0,
                  color: AppColors.deviderColor,
                ),
                SizedBox(height: ConstantSize.getScaleHeight(context) * 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ID Verification'.tr(),
                        style: MyTextStyles.regular14gray),
                    Text('Verify Now'.tr(),
                        style: controller.salutation == false &&
                                controller.fullName == false &&
                                controller.dob == false
                            ? MyTextStyles.medium14Black
                            : MyTextStyles.regular14gray)
                  ],
                ),
                SizedBox(height: ConstantSize.getScaleHeight(context) * 10),
                Text('Not Verified'.tr(),
                    style: controller.salutation == false &&
                            controller.fullName == false &&
                            controller.dob == false
                        ? MyTextStyles.medium14Black
                        : MyTextStyles.regular14gray)
              ]);
        }),
      ),
    );
  }
}
