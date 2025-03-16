import 'package:flutter/material.dart';
import 'package:zynk/constants/theme/colors/app_colors.dart';

class LoginSelectingBox extends StatelessWidget {
  final String imagePath;
  final String text;
  const LoginSelectingBox({
    super.key,
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46.0,
      width: 284.0,
      padding: EdgeInsets.only(left: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: AppColors.specialBoxColor,
      ),
      child: Row(
        spacing: 10.0,
        children: [
          SizedBox(
            height: 46.0,
            width: 46.0,
            child: Image.asset(imagePath),
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
