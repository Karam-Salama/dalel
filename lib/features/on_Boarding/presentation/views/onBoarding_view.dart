// ignore_for_file: file_names, prefer_final_fields

import 'package:dalel_app/core/functions/app_functions.dart';
import 'package:dalel_app/features/on_Boarding/presentation/views/widgets/custom_nav_bar.dart';
import 'package:dalel_app/features/on_Boarding/presentation/views/widgets/get_buttons.dart';
import 'package:dalel_app/features/on_Boarding/presentation/views/widgets/onBoarding_body_widget.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController _controller = PageController(initialPage: 0);
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 40),
            CustomNavBar(
              onPressed: () {
                currentPage == 2
                    ? customReplacementNavigate(context, '/signUp')
                    : _controller.jumpToPage(2);
              },
            ),
            const SizedBox(height: 32),
            OnBoardingWigetBody(
              controller: _controller,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
            ),
            const SizedBox(height: 88),
            GetButtons(
              currentPage: currentPage,
              controller: _controller,
            ),
            const SizedBox(height: 17),
          ],
        ),
      )),
    );
  }
}
