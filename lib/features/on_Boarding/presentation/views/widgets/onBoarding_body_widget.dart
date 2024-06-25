// ignore_for_file: must_be_immutable, file_names


import 'package:dalel_app/core/utils/app_text_style.dart';
import 'package:dalel_app/features/on_Boarding/data/model/onBoarding_model.dart';
import 'package:dalel_app/features/on_Boarding/presentation/views/widgets/custom_smooth_page_indicator.dart';
import 'package:flutter/material.dart';

class OnBoardingWigetBody extends StatelessWidget {
  const OnBoardingWigetBody({
    super.key,
    required this.controller,
    this.onPageChanged,
  });

  final PageController controller;
  final Function(int)? onPageChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: PageView.builder(
          onPageChanged: onPageChanged,
          physics: const BouncingScrollPhysics(),
          controller: controller,
          itemCount: onBoardingList.length,
          itemBuilder: (context, index) {
            return Column(children: [
              Container(
                width: 343,
                height: 290,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(onBoardingList[index].imagePath),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              CustomSmoothPageIndicator(controller: controller),
              const SizedBox(height: 32),
              Text(
                onBoardingList[index].title,
                style: AppTextStyle.poppins500style24
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),
              Text(
                onBoardingList[index].subTitle,
                style: AppTextStyle.poppins300style16,
                textAlign: TextAlign.center,
              ),
            ]);
          }),
    );
  }
}
