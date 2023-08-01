import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:kaufes/view_model/auth_view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../../../res/widgets/global_widgets/custom_text_form_field.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/constant_width.dart';

class DetailProgressScreen2 extends StatefulWidget {
  const DetailProgressScreen2({super.key});

  @override
  State<DetailProgressScreen2> createState() => _DetailProgressScreen2State();
}

// AuthViewModel authViewModel = AuthViewModel();
bool showOtpField = false;

class _DetailProgressScreen2State extends State<DetailProgressScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthViewModel>(builder: (context, language, child) {
        return Consumer<AuthViewModel>(builder: (context, controller, child) {
          return Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'email',
                  style: MyTextStyles.medimBoldBlack,
                ).tr(),
              ),
              SizedBox(height: ConstantSize.getHeight(context) * 0.015),
              CustomTextField(
                controller: controller.businessSignInEmail,
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
              SizedBox(height: ConstantSize.getHeight(context) * 0.015),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'phone_number',
                  style: MyTextStyles.medimBoldBlack,
                ).tr(),
              ),
              SizedBox(height: ConstantSize.getHeight(context) * 0.015),
              InternationalPhoneNumberInput(
                initialValue: controller.phoneNo,
                textFieldController: controller.phoneNoController,
                countrySelectorScrollControlled: true,
                autoValidateMode:AutovalidateMode.onUserInteraction,
                inputDecoration: InputDecoration(
                  
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.blackColor.withOpacity(0.6)),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(5.0),
                  ),

                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 0.0,
                    horizontal: 10.0,
                  ),

                  hintStyle: const TextStyle(
                      color: Colors.grey), // Set the color of the hint text
                ),
                keyboardType: TextInputType.phone,
                onInputChanged: (PhoneNumber value) {
                  setState(() {
                    // showOtpField = value.phoneNumber!.isNotEmpty;
                  });
                },
                onSubmit: () {
                  setState(() {
                    showOtpField = true;
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "phone_required".tr();
                  } else if (value.contains(RegExp(r'[A-Z]'))) {
                    return "invalid_phone".tr();
                  }
                  return null;
                },
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.DROPDOWN,
                ),
              ),
              SizedBox(height: ConstantSize.getHeight(context) * 0.015),
              Visibility(
                  visible: showOtpField,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'check_phone',
                          style: MyTextStyles.medimBoldBlack,
                        ).tr(),
                      ),
                      SizedBox(height: ConstantSize.getHeight(context) * 0.015),
                      CustomTextField(
                        controller: controller.otpController,
                        hintText: 'enter_otp'.tr(),
                        keyboardType: TextInputType.emailAddress,
                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return 'phone_required'.tr();
                        //   }
                        //   return null;
                        // },
                        maxLines: 1,
                      ),
                      SizedBox(height: ConstantSize.getHeight(context) * 0.015),
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'check_phone2',
                              style: MyTextStyles.smalDetailGrey,
                            ).tr(),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'resend_otp',
                              style: MyTextStyles.medimBoldSecondaryColor,
                            ).tr(),
                          ),
                        ],
                      ),
                      SizedBox(height: ConstantSize.getHeight(context) * 0.015),
                    ],
                  )),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'password',
                  style: MyTextStyles.medimBoldBlack,
                ).tr(),
              ),
              SizedBox(height: ConstantSize.getHeight(context) * 0.015),
              CustomTextField(
                controller: controller.createPassword,
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
            ],
          );
        });
      }),
    );
  }
}
