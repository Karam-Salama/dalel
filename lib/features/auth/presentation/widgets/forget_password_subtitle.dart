import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_style.dart';

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