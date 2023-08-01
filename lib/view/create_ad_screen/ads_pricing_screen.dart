import 'package:flutter/material.dart';
import 'package:kaufes/utils/routes/routes.dart';
import 'package:kaufes/view/create_ad_screen/widget_taglist/button_widget.dart';
import '../../res/widgets/global_widgets/align_left_text.dart';
import '../../res/widgets/global_widgets/filter_app_bar.dart';
import '../../utils/constants/colors.dart';
import '../../view_model/create_ad_view_model/creat_view_model.dart';

class SetAdsPriceScreen extends StatefulWidget {
  const SetAdsPriceScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SetAdsPriceScreenState createState() => _SetAdsPriceScreenState();
}

CreateAdViewModel createAdViewModel = CreateAdViewModel();

class _SetAdsPriceScreenState extends State<SetAdsPriceScreen> {
  final GlobalKey<FormState> setPriceDetailsForm = GlobalKey<FormState>();
  String groupName = "";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: FilterAppBar(
        onTapBack: () {
          Navigator.pop(context);
        },
        onTapTrailing: () {},
        height: size.height * 0.05,
        title: 'Select Pricing',
        subTitle: '',
        trailingCheck: false,
      ),
      body: SizedBox(
        height: size.height * 0.905,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: size.height * 0.02,
              horizontal: size.width * 0.05,
            ),
            child: Form(
              key: setPriceDetailsForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  alignCenterLeft(
                    Text(
                      "Set Pricing",
                      style: MyTextStyles.subHeadingBoldBlack,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  buildRadioList(context),
                  SizedBox(height: size.height * 0.03),
                  Visibility(
                    visible: groupName == "Fixed",
                    child: const SetFixPrice(),
                  ),
                  Visibility(
                    visible: groupName == "Auction",
                    child: const SetPriceAuction(),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(height: size.height * 0.09),
                  buildNextButton(
                      context: context,
                      buttonPressed: () {
                        Navigator.pushNamed(
                            context, ScreenRoutes.setAdsLocationScreen);
                      }),
                  SizedBox(height: size.height * 0.05),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRadioList(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
          child: ListTile(
            contentPadding: EdgeInsets.only(left: -size.width * 0.09),
            title: const Text('Fixed Price'),
            leading: Radio(
              activeColor: AppColors.secondaryColor,
              value: "Fixed",
              onChanged: (value) {
                setState(() {
                  groupName = value.toString();
                });
              },
              groupValue: groupName,
            ),
          ),
        ),
        Expanded(
          child: ListTile(
            contentPadding: EdgeInsets.only(left: -size.width * 0.09),
            title: const Text('Auction Price'),
            leading: Radio(
              activeColor: AppColors.secondaryColor,
              value: "Auction",
              onChanged: (value) {
                setState(() {
                  groupName = value.toString();
                });
              },
              groupValue: groupName,
            ),
          ),
        ),
      ],
    );
  }
}

class SetFixPrice extends StatelessWidget {
  const SetFixPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Set Fix Price');
  }
}

class SetPriceAuction extends StatelessWidget {
  const SetPriceAuction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Set Price Auction');
  }
}
