import 'package:doctor_hunt/app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
class AppTextStyles {
  static final TextStyle heading1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static  TextStyle heading2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static  TextStyle bodyLarge = TextStyle(
    fontSize: 16,
      color: AppColors.detailsText

  );

  static  TextStyle bodySmall = TextStyle(
    fontSize: 14,
    color: AppColors.detailsText
  );
}