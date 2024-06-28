import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class ForgetPasswordImage extends StatelessWidget {
  const ForgetPasswordImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 235,
      width: 235,
      child: Image(
        image: AssetImage(Assets.imagesForgetPassword),
      ),
    );
  }
}