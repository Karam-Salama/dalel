import 'package:flutter/material.dart';
import 'package:dalel_app/core/utils/app_text_style.dart';

class WelcomeTextWidget extends StatelessWidget {
  const WelcomeTextWidget({ super.key, required this.text });
  final String text;
  @override
  Widget build(BuildContext context) {
    return 
    Align(
      child: Text(
      text,
      style: AppTextStyle.poppins600style28,
    )
    );
    
  }
}