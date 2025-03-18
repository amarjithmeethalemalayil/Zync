import 'package:flutter/material.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';

class BuildProfileCircle extends StatelessWidget {
  final String name;
  const BuildProfileCircle({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 60.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.specialBoxColor,
            radius: 60.0,
            child: Icon(
              Icons.person,
              size: 80.0,
              color: AppColors.geryColor,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(name),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
