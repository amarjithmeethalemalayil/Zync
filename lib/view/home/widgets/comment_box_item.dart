import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';

class CommentBoxItem extends StatelessWidget {
  final String username;
  final String comment;
  final DateTime date;
  const CommentBoxItem(
      {super.key,
      required this.username,
      required this.comment,
      required this.date});

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
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 2.0,
            children: [
              Text(
                username,
                style: TextStyle(fontSize: 12.0),
              ),
              Text(comment),
              Text(
                formatTimestamp(date),
                style: TextStyle(
                  fontSize: 10.0,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

String formatTimestamp(DateTime timestamp) {
  final formatter =
      DateFormat('MMM d, y • h:mm a'); 
  return formatter.format(timestamp);
}
