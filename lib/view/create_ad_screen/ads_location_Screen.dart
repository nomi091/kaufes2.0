import 'package:flutter/material.dart';
import 'package:kaufes/view/create_ad_screen/widget_taglist/button_widget.dart';

import '../../res/widgets/global_widgets/filter_app_bar.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/constant_width.dart';
import '../../utils/routes/routes.dart';
import '../../view_model/create_ad_view_model/creat_view_model.dart';
import '../google_location/google_suggestion_text_field.dart';

class SetAdsLocationScreen extends StatefulWidget {
  const SetAdsLocationScreen({super.key});

  @override
  State<SetAdsLocationScreen> createState() => _SetAdsLocationScreenState();
}

CreateAdViewModel createAdViewModel = CreateAdViewModel();

class _SetAdsLocationScreenState extends State<SetAdsLocationScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
        title: 'Select Address',
        subTitle: '',
        // trailing: "Reset",
        trailingCheck: false,
      ),
      body: Container(
        height: ConstantSize.getHeight(context) * 0.905,
        color: AppColors.snowBackground,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: ConstantSize.getHeight(context) * 0.02,
                horizontal: ConstantSize.getHeight(context) * 0.05),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Ad Location',
                        style: MyTextStyles.regularDetailBoldBlack),
                  ),
                  SizedBox(
                    height: ConstantSize.getHeight(context) * 0.03,
                  ),
                  const AutocompleteTextField(),
                  SizedBox(
                    height: ConstantSize.getHeight(context) * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customTitleTextList(context, 'City', 'Ebersol'),
                      customTitleTextList(context, 'State', 'Ebersol'),
                    ],
                  ),
                  SizedBox(
                    height: ConstantSize.getHeight(context) * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customTitleTextList(context, 'Zip Code', '9122'),
                      customTitleTextList(context, 'Country ', 'Switzerland'),
                    ],
                  ),
                  SizedBox(
                    height: ConstantSize.getHeight(context) * 0.1,
                  ),
                  buildNextButton(
                      context: context,
                      buttonPressed: () {
                        Navigator.pushNamed(
                            context, ScreenRoutes.uploadMediaScreen);
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget customTitleTextList(BuildContext context, String title, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          child: Text(title, style: MyTextStyles.regularDetailBoldBlack),
        ),
        SizedBox(height: ConstantSize.getHeight(context) * 0.01),
        Container(
          alignment: Alignment.center,
          height: ConstantSize.getHeight(context) * 0.05,
          width: ConstantSize.getWidth(context) * 0.35,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            border: Border.all(color: Colors.black.withOpacity(0.3)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: MyTextStyles.cardBoldBlack,
            ),
          ),
        ),
      ],
    );
  }
}
