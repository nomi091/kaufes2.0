import 'package:flutter/material.dart';
import 'package:kaufes/utils/constants/colors.dart';
import 'package:kaufes/utils/routes/routes.dart';
import 'package:kaufes/view/create_ad_screen/widget_taglist/button_widget.dart';
import 'package:kaufes/view/create_ad_screen/widget_taglist/widget_tag_view.dart';
import '../../model/tags_model.dart';
import '../../res/widgets/global_widgets/align_left_text.dart';
import '../../res/widgets/global_widgets/custom_text_form_field.dart';
import '../../res/widgets/global_widgets/filter_app_bar.dart';
import '../../utils/constants/constant_width.dart';
import '../../utils/constants/strings.dart';
import '../../view_model/create_ad_view_model/creat_view_model.dart';

// ignore: must_be_immutable
class AdsDetailsScreen extends StatefulWidget {
  const AdsDetailsScreen({Key? key}) : super(key: key);

  @override
  State<AdsDetailsScreen> createState() => _AdsDetailsScreenState();
}

GlobalKey<FormState> adsDetailsForm = GlobalKey<FormState>();
CreateAdViewModel createAdViewModel = CreateAdViewModel();

class _AdsDetailsScreenState extends State<AdsDetailsScreen> {
  List<String> conditionButtonTexts = ['Any', 'New', 'Used'];
  final GlobalKey<FormState> adsDetailsForm = GlobalKey<FormState>();

  final List<TagModel> tagsList = [
    TagModel('Tag 1', subTags: ['250GB', '280GB']),
    TagModel('Tag 2', subTags: ['250GB', '280GB']),
    TagModel('Tag 3', subTags: ['250GB', '280GB']),
    TagModel('Tag 4', subTags: ['250GB', '280GB']),
    TagModel('Tag 4', subTags: ['250GB', '280GB']),
    TagModel('Tag 4', subTags: ['250GB', '280GB']),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: FilterAppBar(
        onTapBack: () {
          Navigator.pop(context);
        },
        onTapTrailing: () {},
        height: ConstantSize.getHeight(context) * 0.05,
        title: 'Create Ads Screen',
        subTitle: '',
        // trailing: "Reset",
        trailingCheck: false,
      ),
      body: Container(
        height: ConstantSize.getHeight(context) * 0.905,
        color: AppColors.snowBackground,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: ConstantSize.getHeight(context) * 0.02,
              horizontal: ConstantSize.getWidth(context) * 0.05,
            ),
            child: Form(
              key: adsDetailsForm,
              child: Column(
                children: [
                  alignCenterLeft(
                    Text(
                      "Add a Title",
                      style: MyTextStyles.subHeadingBoldBlack,
                    ),
                  ),
                  SizedBox(
                    height: ConstantSize.getHeight(context) * 0.01,
                  ),
                  CustomTextField(
                    //   controller: authViewModel.signInEmail,
                    hintText: MyStrings.adsTitel,
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
                  SizedBox(height: ConstantSize.getHeight(context) * 0.02),
                  alignCenterLeft(
                    Text(
                      "Description",
                      style: MyTextStyles.subHeadingBoldBlack,
                    ),
                  ),
                  SizedBox(
                    height: ConstantSize.getHeight(context) * 0.01,
                  ),
                  CustomTextField(
                    validator: (validator) {
                      if (validator!.isEmpty) {
                        return "Description Field is required";
                      } else if (validator.length < 50) {
                        return "The Length of Field description has to be greater than 50";
                      } else if (validator.length > 250) {
                        return "The Length of Field description has to be less than 250";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    // fillColor: Colors.white,
                    hintText: 'Description',
                    maxLines: 5,
                  ),
                  alignCenterLeft(
                    Text(
                      "Specifications",
                      style: MyTextStyles.subHeadingBoldBlack,
                    ),
                  ),
                  SizedBox(
                    height: ConstantSize.getHeight(context) * 0.03,
                  ),
                  SizedBox(
                    // height: 200, // Set a fixed height for the container
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: tagsList.length,
                      itemBuilder: (context, index) {
                        return WidgetTagView(
                          tagObject: tagsList[index],
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 5),
                    ),
                  ),
                  buildNextButton(
                      context: context,
                      buttonPressed: () {
                        Navigator.pushNamed(
                            context, ScreenRoutes.setAdsPriceScreen);
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
