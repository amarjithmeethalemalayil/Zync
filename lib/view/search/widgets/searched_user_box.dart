import 'package:flutter/material.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';

class SearchedUserBox extends StatelessWidget {
  final Function()? onTapSearchedUser;
  final String username;
  const SearchedUserBox({super.key, this.onTapSearchedUser, required this.username});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTapSearchedUser,
        child: Card(
          elevation: 5.0,
          color: AppColors.specialColor,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              child: Row(
                spacing: 20.0,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.specialBoxColor,
                    radius: 20.0,
                    child: Icon(
                      Icons.person,
                      size: 10.0,
                      color: AppColors.geryColor,
                    ),
                  ),
                  Text(username)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
