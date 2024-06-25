import 'package:dalel_app/core/functions/app_functions.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_style.dart';
import 'package:dalel_app/core/widgets/custom_btn.dart';
import 'package:flutter/material.dart';

class GetButtons extends StatelessWidget {
  const GetButtons(
      {super.key, required this.currentPage, required this.controller});
  final int currentPage;
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    if (currentPage == 2) {
      return Column(
        children: [
          CustomBtn(
            text: AppStrings.createAccount,
            onPressed: () {
              customReplacementNavigate(context, '/signUp');
            },
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              customReplacementNavigate(context, '/login');
            },
            child: Text(
              AppStrings.loginNow,
              style: AppTextStyle.poppins400style16
                  .copyWith(fontSize: 18)
                  .copyWith(color: AppColors.deepGrey),
            ),
          ),
        ],
      );
    } else {
      return CustomBtn(
        text: AppStrings.next,
        onPressed: () {
          controller.nextPage(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeIn,
          );
        },
      );
    }
  }
}
