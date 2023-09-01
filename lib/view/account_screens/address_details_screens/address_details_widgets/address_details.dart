import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../view_model/account_view_model/account_view_model.dart';
import '../../login_security_screen/login_security_widgets/custom_text_field.dart';

class DetailsTextFields extends StatefulWidget {
  const DetailsTextFields({super.key});

  @override
  State<DetailsTextFields> createState() => _DetailsTextFieldsState();
}

class _DetailsTextFieldsState extends State<DetailsTextFields> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<AccountViewModel>(builder: (context, controller, child) {
      return Column(
        children: [
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.addressTextFieldItems.length,
              itemBuilder: (context, index) {
                return buildCustomTextField(
                    style: MyTextStyles.medium16Black,
                    context: context,
                    textEditingController: controller.currentPasswordController,
                    title: 'Current Password',
                    hitText: 'Enter Current Password');
              }),
        ],
      );
    }));
  }
}
