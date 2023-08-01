import 'package:flutter/material.dart';
import 'package:kaufes/utils/constants/colors.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool _value = false;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _value = !_value;
        });
        widget.onChanged(_value);
      },
      child: Container(
        width: 50.0,
        height: 30.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: _value ? AppColors.primaryColor : AppColors.grayColor,
        ),
        padding: const EdgeInsets.all(2.0),
        child: AnimatedAlign(
          alignment: _value ? Alignment.centerRight : Alignment.centerLeft,
          duration: const Duration(milliseconds: 200),
          child: Container(
            width: 26.0,
            height: 26.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
