import '../../../../../core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSmoothPageIndicator extends StatelessWidget {
  const CustomSmoothPageIndicator({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller, // PageController
      count: 3,
      effect: const ExpandingDotsEffect(
        dotHeight: 7,
        dotWidth: 10,
        activeDotColor: AppColors.deepBrown,
      ), // your preferred effect
      onDotClicked: (index) {
        //event handler
      },
    );
  }
}
