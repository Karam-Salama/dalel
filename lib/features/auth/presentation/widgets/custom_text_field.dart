import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.onChanged,
    this.onFieldSubmitted,
    this.obscureText,
    this.suffixIcon,
  });

  final String labelText;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final bool? obscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 24.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          labelStyle: AppTextStyle.poppins500style18
              .copyWith(color: AppColors.deepGrey),
          suffixIcon: suffixIcon,

          enabledBorder: getBorderStyle(),
          focusedBorder: getBorderStyle(),
          border: getBorderStyle(),
          labelText: labelText,
        ),
      ),
    );
  }
}

OutlineInputBorder getBorderStyle() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        color: AppColors.grey,
      ));
}