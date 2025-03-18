import 'package:flutter/material.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';

import 'package:zynk/core/theme/text_theme/text_theme.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    iconTheme: IconThemeData(
      color: AppColors.whiteColor,
    ),
    textTheme: TextTheme(
      headlineLarge: AppTextTheme.textTheme.headlineLarge,
      headlineMedium: AppTextTheme.textTheme.headlineMedium,
      headlineSmall: AppTextTheme.textTheme.headlineSmall,
      bodyMedium: AppTextTheme.textTheme.bodyMedium,
    ),
  );
}
