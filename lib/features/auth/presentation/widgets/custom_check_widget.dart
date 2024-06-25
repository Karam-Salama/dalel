import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool? value = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      side: const BorderSide(color: AppColors.grey, width: 1.0),
      onChanged: (newValue) {
        setState(() {
          value = newValue!;
        });
      },
    );
  }
}
