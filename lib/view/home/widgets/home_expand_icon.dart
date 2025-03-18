import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';

class HomeExpandIcon extends StatelessWidget {
  final IconData icon;
  final String purpose;
  const HomeExpandIcon({super.key, required this.icon, required this.purpose});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        spacing: 10.0,
        children: [
          Icon(icon, color: AppColors.whiteColor, size: 28),
          Text(
            purpose,
            style: TextStyle(color: AppColors.whiteColor, fontSize: 12.0),
          )
        ],
      ),
    );
  }
}