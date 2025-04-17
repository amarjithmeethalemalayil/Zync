import 'package:flutter/material.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final Icon prefixIcon;
  final TextEditingController controller;
  final Function(String)? onFieldSubmitted;

  const AppTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46.0,
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: AppColors.whiteColor),
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30.0),
          ),
          prefixIcon: prefixIcon,
          prefixIconColor: AppColors.whiteColor,
          filled: true,
          hintStyle: TextStyle(
            color: AppColors.whiteColor,
          ),
          fillColor: AppColors.specialBoxColor,
          isDense: true,
        ),
      ),
    );
  }
}
