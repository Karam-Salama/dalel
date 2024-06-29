import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_style.dart';
import 'custom_check_widget.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsWidget extends StatelessWidget {
  const TermsAndConditionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomCheckBox(),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: AppStrings.iHaveAgreeTo,
              style: AppTextStyle.poppins400style16
                  .copyWith(fontSize: 12, color: AppColors.deepGrey)),
          TextSpan(
              text: AppStrings.termsAndConditions,
              style: AppTextStyle.poppins400style16.copyWith(
                  fontSize: 12,
                  color: AppColors.deepGrey,
                  decoration: TextDecoration.underline)),
        ])),
      ],
    );
  }
}

