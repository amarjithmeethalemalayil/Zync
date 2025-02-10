import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zynk/constants/theme/colors/app_colors.dart';

class AppTextTheme {
  static TextTheme textTheme = TextTheme(
    headlineLarge: GoogleFonts.climateCrisis(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      color: AppColors.whiteColor,
    ),
    headlineMedium: GoogleFonts.alfaSlabOne(
      fontSize: 24.0,
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w200,
    ),
    headlineSmall: GoogleFonts.allertaStencil(
      fontSize: 20.0,
      color: AppColors.whiteColor,
      fontWeight: FontWeight.w500,
    ),
  ); 
}
