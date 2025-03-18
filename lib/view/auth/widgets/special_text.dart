import 'package:flutter/material.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';

class SpecialText extends StatelessWidget {
  final String content;
  const SpecialText({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.secondaryColor,
            fontWeight: FontWeight.w600,
          ),
    );
  }
}
