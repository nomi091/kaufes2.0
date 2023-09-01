import 'package:flutter/material.dart';
import 'package:kaufes/utils/constants/colors.dart';
import 'package:kaufes/utils/constants/constant_width.dart';

class RadioButtonsDialog extends StatefulWidget {
  const RadioButtonsDialog({super.key});

  @override
  _RadioButtonsDialogState createState() => _RadioButtonsDialogState();
}

class _RadioButtonsDialogState extends State<RadioButtonsDialog> {
  String selectedOption = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select an option'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RadioListTile(
            title:  Text('Price High to low',style:  MyTextStyles.regularDetailBoldBlack,),
            value: 'Price High to low"',
            groupValue: selectedOption,
            onChanged: (value) {
              setState(() {
                selectedOption = value!.toString();
              });
              print(selectedOption);
            },
            activeColor: AppColors.primaryColor,
          ),
          RadioListTile(
            title:  Text('Price Low to High',style: MyTextStyles.regularDetailBoldBlack,),
            value: 'Price Low to High',
            groupValue: selectedOption,
            onChanged: (value) {
              setState(() {
                selectedOption = value!.toString();
              });
              print(selectedOption);
            },
            activeColor: AppColors.primaryColor,
          ),
          RadioListTile(
            title:  Text('Newly Added',style: MyTextStyles.regularDetailBoldBlack),
            value: 'Newly Added',
            groupValue: selectedOption,
            onChanged: (value) {
              setState(() {
                selectedOption = value!.toString();
              });
              print(selectedOption);
            },
            activeColor: AppColors.primaryColor,
          ),
        ],
      ),
      actions: <Widget>[
        Center(
          child: SizedBox(
            width: ConstantSize.getWidth(context) * 0.4,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Apply')),
          ),
        )
      ],
    );
  }
}
