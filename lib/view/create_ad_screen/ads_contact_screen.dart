import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:kaufes/utils/constants/colors.dart';
import 'package:kaufes/view/create_ad_screen/widget_taglist/button_widget.dart';
import 'package:kaufes/view/create_ad_screen/widget_taglist/custom_switch.dart';
import 'package:kaufes/view_model/create_ad_view_model/creat_view_model.dart';

import '../../res/widgets/global_widgets/align_left_text.dart';
import '../../res/widgets/global_widgets/custom_text_form_field.dart';
import '../../res/widgets/global_widgets/filter_app_bar.dart';
import '../../utils/constants/constant_width.dart';
import '../../utils/routes/routes.dart';

// class AdsReviewContactScreen extends StatefulWidget {
//   const AdsReviewContactScreen({Key? key}) : super(key: key);

//   @override
//   State<AdsReviewContactScreen> createState() => _AdsReviewContactScreenState();
// }

// class _AdsReviewContactScreenState extends State<AdsReviewContactScreen> {
//   @override
//   Widget build(BuildContext context) {
//     CreateAdViewModel createAdViewModel = CreateAdViewModel();
//     bool showPhoneNumberInput = true;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: FilterAppBar(
//         onTapTrailing: () {},
//         height: ConstantSize.getHeight(context) * 0.05,
//         title: 'Select Contact',
//         subTitle: '',
//         // trailing: "Reset",
//         trailingCheck: false,
//       ),
//       body: Container(
//         height: ConstantSize.getHeight(context) * 0.905,
//         color: AppColors.whiteColor,
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Padding(
//             padding: EdgeInsets.symmetric(
//                 vertical: ConstantSize.getHeight(context) * 0.02,
//                 horizontal: ConstantSize.getWidth(context) * 0.05),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 alignCenterLeft(
//                   Text(
//                     "Review Contact details",
//                     style: MyTextStyles.subHeadingBoldBlack,
//                   ),
//                 ),
//                 SizedBox(
//                   height: ConstantSize.getHeight(context) * 0.03,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     alignCenterLeft(
//                       Text(
//                         "Show my contact details",
//                         style: MyTextStyles.subHeadingBoldBlack,
//                       ),
//                     ),
//                     CustomSwitch(
//                       value: true,
//                       onChanged: (bool newValue) {
//                         setState(() {
//                           showPhoneNumberInput = newValue;
//                           print('Bool Value $showPhoneNumberInput');
//                         });
//                       },
//                     )
//                   ],
//                 ),
//                 AnimatedSwitcher(
//                   duration: const Duration(milliseconds: 200),
//                   child: showPhoneNumberInput
//                       ? Container(
//                           height: 20,
//                           width: 40,
//                           color: Colors.amber,
//                         )
//                       : Container(
//                           height: 20,
//                           width: 40,
//                           color: Colors.green,
//                         ),
//                 ),

//                 // showPhoneNumberInput
//                 //     ? Column(children: [
//                 //         SizedBox(
//                 //           height: ConstantSize.getHeight(context) * 0.03,
//                 //         ),
//                 //         buildTextFiled(
//                 //             context: context,
//                 //             title: 'Full Name',
//                 //             hintText: "jhon doe"),
//                 //         SizedBox(
//                 //           height: ConstantSize.getHeight(context) * 0.03,
//                 //         ),
//                 //         buildTextFiled(
//                 //             context: context,
//                 //             title: 'Email',
//                 //             hintText: "jhon@gmail.com"),
//                 //         SizedBox(
//                 //           height: ConstantSize.getHeight(context) * 0.03,
//                 //         ),
//                 //         alignCenterLeft(
//                 //           Text(
//                 //             "Show my contact details",
//                 //             style: MyTextStyles.subHeadingBoldBlack,
//                 //           ),
//                 //         ),
//                 //         SizedBox(
//                 //           height: ConstantSize.getHeight(context) * 0.01,
//                 //         ),
//                 //         InternationalPhoneNumberInput(
//                 //           initialValue: createAdViewModel.phoneNo,
//                 //           textFieldController:
//                 //               createAdViewModel.phoneNoController,
//                 //           countrySelectorScrollControlled: true,
//                 //           inputDecoration: InputDecoration(
//                 //             border: OutlineInputBorder(
//                 //               borderRadius: BorderRadius.circular(5.0),
//                 //             ),
//                 //             focusedBorder: const OutlineInputBorder(
//                 //               borderSide:
//                 //                   BorderSide(color: AppColors.primaryColor),
//                 //             ),
//                 //             contentPadding: const EdgeInsets.symmetric(
//                 //                 vertical: 10.0,
//                 //                 horizontal:
//                 //                     10.0), // Adjust the values to decrease the size
//                 //           ),
//                 //           keyboardType: TextInputType.phone,
//                 //           onInputChanged: (PhoneNumber value) {},
//                 //           selectorConfig: const SelectorConfig(
//                 //             selectorType: PhoneInputSelectorType.DROPDOWN,
//                 //           ),
//                 //         ),
//                 //         SizedBox(
//                 //           height: ConstantSize.getHeight(context) * 0.3,
//                 //         ),
//                 //       ])
//                 //     : const SizedBox(),
//                 buildNextButton(
//                     context: context,
//                     buttonPressed: () {
//                       Navigator.pushNamed(
//                           context, ScreenRoutes.uploadMediaScreen);
//                     })
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

class AdsReviewContactScreen extends StatefulWidget {
  const AdsReviewContactScreen({Key? key}) : super(key: key);

  @override
  State<AdsReviewContactScreen> createState() => _AdsReviewContactScreenState();
}

class _AdsReviewContactScreenState extends State<AdsReviewContactScreen> {
  bool showPhoneNumberInput = true;

  @override
  Widget build(BuildContext context) {
    CreateAdViewModel createAdViewModel = CreateAdViewModel();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: FilterAppBar(
        onTapBack: () {
          Navigator.pop(context);
        },
        onTapTrailing: () {},
        height: ConstantSize.getHeight(context) * 0.05,
        title: 'Select Contact',
        subTitle: '',
        trailingCheck: false,
      ),
      body: Container(
        height: ConstantSize.getHeight(context) * 0.905,
        color: AppColors.whiteColor,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: ConstantSize.getHeight(context) * 0.02,
              horizontal: ConstantSize.getWidth(context) * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Review Contact details",
                    style: MyTextStyles.subHeadingBoldBlack,
                  ),
                ),
                SizedBox(
                  height: ConstantSize.getHeight(context) * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Show my contact details",
                        style: MyTextStyles.subHeadingBoldBlack,
                      ),
                    ),
                    CustomSwitch(
                      value: true,
                      onChanged: (bool newValue) {
                        setState(() {
                          showPhoneNumberInput = newValue;
                          //  print('Bool Value $showPhoneNumberInput');
                        });
                      },
                    ),
                  ],
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: showPhoneNumberInput
                      ? Column(children: [
                          SizedBox(
                            height: ConstantSize.getHeight(context) * 0.03,
                          ),
                          buildTextFiled(
                              context: context,
                              title: 'Full Name',
                              hintText: "jhon doe"),
                          SizedBox(
                            height: ConstantSize.getHeight(context) * 0.03,
                          ),
                          buildTextFiled(
                              context: context,
                              title: 'Email',
                              hintText: "jhon@gmail.com"),
                          SizedBox(
                            height: ConstantSize.getHeight(context) * 0.03,
                          ),
                          alignCenterLeft(
                            Text(
                              "Show my contact details",
                              style: MyTextStyles.subHeadingBoldBlack,
                            ),
                          ),
                          SizedBox(
                            height: ConstantSize.getHeight(context) * 0.01,
                          ),
                          InternationalPhoneNumberInput(
                            initialValue: createAdViewModel.phoneNo,
                            textFieldController:
                                createAdViewModel.phoneNoController,
                            countrySelectorScrollControlled: true,
                            inputDecoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.primaryColor),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal:
                                      10.0), // Adjust the values to decrease the size
                            ),
                            keyboardType: TextInputType.phone,
                            onInputChanged: (PhoneNumber value) {},
                            selectorConfig: const SelectorConfig(
                              selectorType: PhoneInputSelectorType.DROPDOWN,
                            ),
                          ),
                          SizedBox(
                            height: ConstantSize.getHeight(context) * 0.3,
                          ),
                        ])
                      : SizedBox(
                          height: ConstantSize.getHeight(context) * 0.68,
                        ),
                ),
                buildNextButton(
                  context: context,
                  buttonPressed: () {
                    Navigator.pushNamed(
                      context,
                      ScreenRoutes.bottomNavBar,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextFiled({context, title, controller, hintText}) {
    return Column(
      children: [
        alignCenterLeft(
          Text(
            title,
            style: MyTextStyles.subHeadingBoldBlack,
          ),
        ),
        SizedBox(
          height: ConstantSize.getHeight(context) * 0.01,
        ),
        CustomTextField(
          //   controller: authViewModel.signInEmail,
          hintText: hintText,
          keyboardType: TextInputType.multiline,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Title is required';
            } else if (value.length > 50) {
              return "The Title has to be less than 50 characters";
            }
            return null;
          },
          maxLines: 1,
        ),
      ],
    );
  }
}
