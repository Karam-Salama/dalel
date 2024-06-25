// ignore_for_file: file_names

import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:dalel_app/core/utils/app_strings.dart';

class OnBoardingModel {
  final String imagePath;
  final String title;
  final String subTitle;

  OnBoardingModel({
    required this.imagePath,
    required this.title,
    required this.subTitle,
  });
}

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    imagePath: Assets.imagesOnBoarding1,
    title: AppStrings.titleOnBoarding1,
    subTitle: AppStrings.subTitleOnBoarding1,
  ),
  OnBoardingModel(
    imagePath: Assets.imagesOnBoarding2,
    title: AppStrings.titleOnBoarding2,
    subTitle: AppStrings.subTitleOnBoarding2,
  ),
  OnBoardingModel(
    imagePath: Assets.imagesOnBoarding3,
    title: AppStrings.titleOnBoarding3,
    subTitle: AppStrings.subTitleOnBoarding3,
  ),
];
