import 'package:flutter/material.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';

class InfoButtonExpanded extends StatelessWidget {
  const InfoButtonExpanded({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children:  [
            _homeExpandedIcon(
              icon: Icons.favorite,
              purpose: "999",
            ),
            _homeExpandedIcon(
              icon: Icons.comment_outlined,
              purpose: "999",
            ),
            _homeExpandedIcon(
              icon: Icons.share_outlined,
              purpose: "Share",
            ),
          ],
        ),
      ),
    );
  }

  Widget _homeExpandedIcon({
  required IconData icon,
  required String purpose,
  }) {
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
