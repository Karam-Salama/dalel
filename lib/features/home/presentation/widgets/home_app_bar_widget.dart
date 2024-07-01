import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomHomeAppBarWidget extends StatelessWidget {
  const CustomHomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(Assets.imagesMenu),
        Text(
          AppStrings.appName,
          style: AppTextStyle.pacifico400style64.copyWith(fontSize: 22),
        ),
      ],
    );
  }
}
