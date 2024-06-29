// ignore_for_file: prefer_const_declarations

import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyle {
  static final pacifico400style64 = const TextStyle(
    fontSize: 64,
    fontWeight: FontWeight.w400,
    color: AppColors.deepBrown,
    fontFamily: 'Pacifico',
  );

  static final pacifico600style28 = const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: AppColors.deepBrown,
    fontFamily: 'Pacifico',
  );

  static final poppins300style16 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: AppColors.black,
    fontFamily: 'Poppins',
  );

  static final poppins400style16 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
    fontFamily: 'Poppins',
  );

  static final poppins500style24 = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontFamily: 'Poppins',
  );

  static final poppins500style18 = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.offWhite,
    fontFamily: 'Poppins',
  );

  static final poppins500style12 = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.deepGrey,
    fontFamily: 'Poppins',
  );

  static final poppins600style28 = const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
    fontFamily: 'Poppins',
  );

  static final pacificoBoldstyle42 = const TextStyle(
    fontSize: 42,
    fontWeight: FontWeight.bold,
    color: AppColors.offWhite,
    fontFamily: 'Pacifico',
  );
}
