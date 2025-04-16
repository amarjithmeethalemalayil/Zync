import 'package:flutter/material.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';

class VideoAccountinfoSection extends StatelessWidget {
  final String username;
  final String caption;
  final Function()? gotoAccount;

  const VideoAccountinfoSection({
    super.key,
    required this.username,
    required this.caption,
    this.gotoAccount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 50,
        horizontal: 20.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 10.0,
        children: [
          GestureDetector(
            onTap: gotoAccount,
            child: CircleAvatar(
              backgroundColor: AppColors.specialBoxColor,
              radius: 30.0,
              child: Icon(
                Icons.person,
                size: 20.0,
                color: AppColors.geryColor,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(username),
              Text(caption),
              SizedBox(height: 8.0),
            ],
          ),
        ],
      ),
    );
  }
}
