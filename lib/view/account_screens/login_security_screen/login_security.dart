import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/constant_width.dart';
import '../../../view_model/account_view_model/account_view_model.dart';
import '../../../widgets/global_widgets/filter_app_bar.dart';
import 'login_security_widgets/social_accounts.dart';
import 'login_security_widgets/user_details_widget.dart';

class LoginSecurityScreen extends StatefulWidget {
  const LoginSecurityScreen({super.key});

  @override
  State<LoginSecurityScreen> createState() => _LoginSecurityScreenState();
}

class _LoginSecurityScreenState extends State<LoginSecurityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.snowBackground,
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
            return SingleChildScrollView(
              child: SizedBox(
                //height: ConstantSize.getHeight(context)*1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  const [
                  UserDetails(),
                  SocialAccounts(),
                  SizedBox(height: 20,),
                  ],
                ),
              ),
            );
          }),
        ));
  }
}
