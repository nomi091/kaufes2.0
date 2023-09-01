// File: filter_screen.dart

import 'package:flutter/material.dart';
import 'package:kaufes/widgets/global_widgets/align_left_text.dart';
import 'package:kaufes/utils/constants/constant_width.dart';
import 'package:kaufes/utils/routes/routes.dart';
import '../../../widgets/global_widgets/category_Filter_widget.dart';
import '../../../widgets/global_widgets/custom_text_form_field.dart';
import '../../../widgets/global_widgets/filter_app_bar.dart';
import '../../../widgets/global_widgets/primary_button.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/strings.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String selectedCategory = '';
  String selectedSubCategory = '';
  String selectedLocation = '';
  final TextEditingController _priceController = TextEditingController();
  int _selectedConditionButtonIndex = 0;
  int _selectedAdButtonIndex = 0;
  List<String> conditionButtonTexts = ['Any', 'New', 'Used'];
  List<String> adtypeButtonTexts = ['All', 'Fixed Price', 'Auctions'];

  void _resetFilter() {
    setState(() {
      selectedCategory = '';
      selectedSubCategory = '';
      _selectedConditionButtonIndex = 0;
      _selectedAdButtonIndex = 0;
      selectedLocation = '';
      _priceController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.square(size.height * 0.07),
        child: FilterAppBar(
          onTapBack: () {
            Navigator.pop(context);
          },
          onTapTrailing: _resetFilter,
          height: size.height * 0.05,
          title: 'Filter',
          subTitle: 'Reset',
          // trailing: "Reset",
          trailingCheck: true,
        ),
      ),
      body: Container(
        color: Colors.white,
        height: ConstantSize.getHeight(context) * 1,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 25.0, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, ScreenRoutes.allCategoriesList);
                },
                child: CategoryFilterWidget(
                  title: "Category",
                  hasIcon: true,
                  hasDivider: true,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Electronics',
                      style: MyTextStyles.headingDetailGrey,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: ConstantSize.getHeight(context) * 0.02,
              ),
              InkWell(
                onTap: () {},
                child: CategoryFilterWidget(
                  title: "Sub Category",
                  hasIcon: true,
                  hasDivider: true,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Mobile',
                      style: MyTextStyles.headingDetailGrey,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: ConstantSize.getHeight(context) * 0.02,
              ),
              InkWell(
                onTap: () {},
                child: CategoryFilterWidget(
                  title: "Location",
                  hasIcon: true,
                  hasDivider: true,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      '',
                      style: MyTextStyles.headingDetailGrey,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: ConstantSize.getHeight(context) * 0.02,
              ),
              Column(
                children: [
                  alignCenterLeft(Text(
                    'Price',
                    style: MyTextStyles.subHeadingBoldBlack,
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: ConstantSize.getHeight(context) * 0.06,
                          child: CustomTextField(
                            // controller: authViewModel.signInEmail,
                            hintText: '\$ 5',
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Email is required';
                              } else if (!value.contains('@')) {
                                return 'Invalid email';
                              }
                              return null;
                            },
                            maxLines: 1,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: ConstantSize.getHeight(context) * 0.06,
                          child: CustomTextField(
                            // controller: authViewModel.signInEmail,
                            hintText: '\$ 5000',
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Email is required';
                              } else if (!value.contains('@')) {
                                return 'Invalid email';
                              }
                              return null;
                            },
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(color: AppColors.blackColor, height: 11),
                ],
              ),
              SizedBox(
                height: ConstantSize.getHeight(context) * 0.02,
              ),
              Column(
                children: [
                  alignCenterLeft(Text(
                    'Condition',
                    style: MyTextStyles.subHeadingBoldBlack,
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (var i = 0; i < 3; i++)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: ConstantSize.getWidth(context) * 0.22,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    _selectedConditionButtonIndex == i
                                        ? AppColors.primaryColor
                                        : AppColors.filterButtonColor,
                              ),
                              onPressed: () => _onConditionButtonPressed(i),
                              child: Text(
                                conditionButtonTexts[i],
                                style: TextStyle(
                                  color: _selectedConditionButtonIndex == i
                                      ? AppColors.whiteColor
                                      : AppColors.blackColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: ConstantSize.getHeight(context) * 0.02,
              ),
              Column(
                children: [
                  alignCenterLeft(Text(
                    'Ad Type',
                    style: MyTextStyles.subHeadingBoldBlack,
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (var i = 0; i < 3; i++)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _selectedAdButtonIndex == i
                                    ? AppColors.primaryColor
                                    : AppColors.filterButtonColor,
                              ),
                              onPressed: () => _onAdButtonPressed(i),
                              child: Text(
                                adtypeButtonTexts[i],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: _selectedAdButtonIndex == i
                                      ? AppColors.whiteColor
                                      : AppColors.blackColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: ConstantSize.getHeight(context) * 0.23,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: BtnPrimeryBackground(
                  onPressed: () {
                    Navigator.pop(context);
                    // if (signInForm.currentState!.validate()) {
                    //   value.loginApi(context);
                    // }
                  },
                  title: MyStrings.apply,
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
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onConditionButtonPressed(int index) {
    setState(() {
      _selectedConditionButtonIndex = index;
    });
  }

  void _onAdButtonPressed(int index) {
    setState(() {
      _selectedAdButtonIndex = index;
    });
  }
}
