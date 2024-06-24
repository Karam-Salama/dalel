// ignore_for_file: must_be_immutable, file_names

import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_style.dart';
import 'package:dalel_app/features/on_Boarding/presentation/views/widgets/custom_smooth_page_indicator.dart';
import 'package:flutter/material.dart';

class OnBoardingWigetBody extends StatelessWidget {
  OnBoardingWigetBody({super.key});
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
          controller: controller,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Column(children: [
              Image.asset(Assets.imagesOnBoarding1),
              const SizedBox(height: 24),
              CustomSmoothPageIndicator(controller: controller),
              const SizedBox(height: 32),
              Text(
                AppStrings.titleOnBoarding1,
                style: AppTextStyle.poppins500style24
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                AppStrings.subTitleOnBoarding1,
                style: AppTextStyle.poppins300style16,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 88),
            ]);
          }),
    );
  }
}
