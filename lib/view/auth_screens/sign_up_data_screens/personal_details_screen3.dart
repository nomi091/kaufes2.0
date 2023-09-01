import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_model/auth_view_model/complete_signup_profil_view_model.dart';
import '../../../widgets/global_widgets/custom_text_form_field.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/constant_width.dart';
import 'package:csc_picker/csc_picker.dart';

class DetailProgressScreen3 extends StatefulWidget {
  const DetailProgressScreen3({super.key});

  @override
  State<DetailProgressScreen3> createState() => _DetailProgressScreen3State();
}

// AuthViewModel authViewModel = AuthViewModel();

class _DetailProgressScreen3State extends State<DetailProgressScreen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Consumer<SignUpProfileViewModel>(builder: (context, language, child) {
        return Consumer<SignUpProfileViewModel>(
            builder: (context, controller, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                buildCustomTextField(
                    title: 'street_address'.tr(),
                    validatorText: 'street_validator'.tr(),
                    errorText: controller.streetAddressError == ""
                        ? null
                        : controller.streetAddressError.tr(),
                    hitText: 'street_address'.tr(),
                    textEditingController: controller.streetAddressController),
                SizedBox(
                  height: ConstantSize.getHeight(context) * 0.01,
                ),
                buildCustomTextField(
                    title: 'house_number'.tr(),
                    validatorText: 'house_number_validator'.tr(),
                    errorText: controller.houseNumberError == ""
                        ? null
                        : controller.houseNumberError.tr(),
                    textEditingController: controller.houseNumberController,
                    hitText: 'house_number'.tr()),
                SizedBox(
                  height: ConstantSize.getHeight(context) * 0.01,
                ),
                buildCustomTextField(
                    title: 'postcode'.tr(),
                    errorText: controller.postCodeError == ""
                        ? null
                        : controller.postCodeError.tr(),
                    validatorText: 'postcode_validator'.tr(),
                    textEditingController: controller.postCodeController,
                    hitText: 'postcode'.tr()),
                SizedBox(
                  height: ConstantSize.getHeight(context) * 0.02,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'country'.tr(),
                            style: MyTextStyles.medium16Black,
                          ).tr(),
                        ),
                        SizedBox(
                          width: ConstantSize.getWidth(context) * 0.35,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'state'.tr(),
                            style: MyTextStyles.medium16Black,
                          ).tr(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ConstantSize.getHeight(context) * 0.01,
                    ),
                    CSCPicker(
                      showStates: true,
                      showCities: false,
                      flagState: CountryFlag.ENABLE,

                      dropdownDecoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          // color: Colors.white,
                          border: Border.all(
                              color: AppColors.blackColor.withOpacity(0.5),
                              width: 1)),
                      disabledDropdownDecoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          color: AppColors.whiteColor,
                          border: Border.all(
                              color: AppColors.blackColor.withOpacity(0.5),
                              width: 1)),

                      countrySearchPlaceholder: "Country",
                      citySearchPlaceholder: "City",
                      countryDropdownLabel: "Country",
                      cityDropdownLabel: "City",

                      // countryFilter: const [
                      //   CscCountry.Germany,
                      //   CscCountry.Swaziland,
                      //   CscCountry.Austria
                      // ],

                      selectedItemStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),

                      dropdownHeadingStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),

                      dropdownItemStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),

                      dropdownDialogRadius: 10.0,

                      searchBarRadius: 10.0,

                      onCountryChanged: (value) {
                        setState(() {
                          ///store value in country variable
                          controller.countryValue = value.toString();
                        });
                      },

                      onStateChanged: (value) {
                        setState(() {
                          ///store value in state variable
                          controller.stateValue = value.toString();
                        });
                      },

                      onCityChanged: (value) {
                        setState(() {
                          //  controller.cityValue = value.toString();
                        });
                      },
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        controller.countryError.tr(),
                        style: MyTextStyles.errorStyleTextField,
                      ).tr(),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        controller.streetAddressError.tr(),
                        style: MyTextStyles.errorStyleTextField,
                      ).tr(),
                    )
                  ],
                ),
              ],
            ),
          );
        });
      }),
    );
  }

  Widget buildCustomTextField(
      {title, hitText, validatorText, textEditingController, errorText}) {
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
          controller: textEditingController,
          hintText: hitText,
          errorText: errorText,
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
