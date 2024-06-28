import 'package:dalel_app/core/functions/app_functions.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class ForgetPasswordTextWidget extends StatelessWidget {
  const ForgetPasswordTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //customReplacementNavigate(context, '/resetPassword');
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          AppStrings.forgotPassword,
          style: AppTextStyle.poppins600style28.copyWith(fontSize: 12),
        ),
      ),
    );
  }
}