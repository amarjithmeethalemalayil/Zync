import 'package:flutter/material.dart';

import 'package:zynk/constants/theme/text_theme/text_theme.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    textTheme: TextTheme(
      headlineLarge: AppTextTheme.textTheme.headlineLarge,
      headlineMedium: AppTextTheme.textTheme.headlineMedium,
      headlineSmall: AppTextTheme.textTheme.headlineSmall,
    ),
  );
}
