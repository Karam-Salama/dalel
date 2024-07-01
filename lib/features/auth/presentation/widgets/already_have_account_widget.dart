import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';

class HaveAccountWidget extends StatelessWidget {
  const HaveAccountWidget({
    super.key,
    required this.textpart1,
    required this.textpart2,
    required this.onPress,
  });
  final String textpart1;
  final String textpart2;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text.rich(TextSpan(children: [
            TextSpan(
                text: textpart1,
                style: AppTextStyle.poppins400style16.copyWith(fontSize: 12)),
            TextSpan(
              text: textpart2,
              style: AppTextStyle.poppins400style16
                  .copyWith(fontSize: 12)
                  .copyWith(color: AppColors.lightGrey),
            ),
          ])),
        ],
      ),
    );
  }
}
