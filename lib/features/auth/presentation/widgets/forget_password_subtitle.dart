import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class ForgetPasswordSubtitleWidget extends StatelessWidget {
  const ForgetPasswordSubtitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34.0),
      child: Text(
        AppStrings.forgotPasswordScreenSubTitle,
        style: AppTextStyle.poppins400style16.copyWith(fontSize: 14),
        textAlign: TextAlign.center,
      ),
    );
  }
}