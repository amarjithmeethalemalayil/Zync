import 'package:flutter/material.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';

class CommentBoxItem extends StatelessWidget {
  const CommentBoxItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.specialColor,
              radius: 20.0,
              child: Icon(
                Icons.person,
                size: 10.0,
                color: AppColors.geryColor,
              ),
            ),
            Column(
              children: [
                Text("Username"),
                Text("Comment"),
              ],
            )
          ],
        ),
      );
  }
}