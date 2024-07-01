

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomCategoryListViewItem extends StatelessWidget {
  const CustomCategoryListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 74,
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: AppColors.grey,
              blurRadius: 5,
              spreadRadius: 0,
              offset: Offset(0, 2.5),
            )
          ]),
      child: Column(children: [
        Container(
          width: 74,
          height: 96,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: const DecorationImage(
                image: AssetImage(Assets.imagesFrame3), fit: BoxFit.fill),
          ),
        ),
        const SizedBox(
          height: 11,
        ),
        Text(
          AppStrings.lionHeart,
          style: AppTextStyle.poppins500style14,
        )
      ]),
    );
  }
}
