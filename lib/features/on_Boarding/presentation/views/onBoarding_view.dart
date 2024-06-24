// ignore_for_file: file_names

import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/widgets/custom_btn.dart';
import 'package:dalel_app/features/on_Boarding/presentation/views/widgets/custom_nav_bar.dart';
import 'package:dalel_app/features/on_Boarding/presentation/views/widgets/onBoarding_body_widget.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const CustomNavBar(),
            const SizedBox(
              height: 32,
            ),
            OnBoardingWigetBody(),
            const CustomBtn(text: AppStrings.next,),
            const SizedBox(
              height: 17,
            ),
          ],
        ),
      )),
    );
  }
}
