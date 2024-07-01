import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class HistoricalPeriodItem extends StatelessWidget {
  const HistoricalPeriodItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 164,
      height: 96,
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
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const SizedBox(
          width: 16,
        ),
        SizedBox(
          width: 62,
          height: 48,
          child: Text(
            AppStrings.ancientEgypt,
            style: AppTextStyle.poppins500style12.copyWith(fontSize: 15),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: 64,
          height: 47,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(Assets.imagesFrame),
          )),
        )
      ]),
    );
  }
}
