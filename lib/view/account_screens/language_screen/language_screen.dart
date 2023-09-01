import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kaufes/utils/constants/image_paths.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/constant_width.dart';
import '../../../view_model/language_view_model/language_view_model.dart';
import '../../../widgets/global_widgets/filter_app_bar.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  int selectedCountryIndex = -1;

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
      body: Consumer<LanguageViewModel>(builder: (context, controller, child) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ConstantSize.getWidth(context) * 0.06,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: ConstantSize.getScaleHeight(context) * 24,
              ),
              Text(
                'Language Settings',
                style: MyTextStyles.medium20Black,
              ),
              SizedBox(
                height: ConstantSize.getScaleHeight(context) * 8,
              ),
              Text(
                'Choose your language',
                style: MyTextStyles.regular14gray,
              ),
              SizedBox(
                height: ConstantSize.getScaleHeight(context) * 10,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: controller.countries.length,
                itemBuilder: (context, index) {
                  final languageProvider =
                      Provider.of<LanguageViewModel>(context);
                  final isSelected = languageProvider.selectedLocale ==
                      controller.countries[index].locale;
                  return ListTile(
                    onTap: () async {
                      await languageProvider
                          .setLocale(controller.countries[index].locale);
                    },
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              controller.countries[index].flag,
                              width: 25.0, // Adjust the size as needed
                              height: 18.0,
                            ),
                            const SizedBox(
                              width: 10.0, // Adjust the spacing as needed
                            ),
                            Text(
                              controller.countries[index].name,
                              style: isSelected
                                  ? MyTextStyles.medium16Black
                                  : MyTextStyles.medium16gray,
                            ),
                          ],
                        ),
                        if (isSelected)
                          SvgPicture.asset(
                            AppImages
                                .iconCheckFill, // Adjust the path to your check icon
                            width: 25.0, // Adjust the size as needed
                            height: 25.0,
                          )
                        else
                          Container(),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        );
      }),
    );
  }
}
