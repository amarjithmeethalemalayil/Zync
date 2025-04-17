import 'package:flutter/material.dart';

class BuildFollowSection extends StatelessWidget {
  final String followCount;
  final String followersCount;

  const BuildFollowSection({
    super.key,
    required this.followCount,
    required this.followersCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10.0,
      children: [
        _buildFloowFollowers(context: context, following: true,count: followCount),
        _buildFloowFollowers(context: context, following: false,count: followersCount),
      ],
    );
  }

  Widget _buildFloowFollowers({
    required BuildContext context,
    required bool following,
    required String count,
  }) {
    return Column(
      spacing: 10.0,
      children: [
        following
            ? Text(
                "Following",
                style: Theme.of(context).textTheme.headlineSmall,
              )
            : Text(
                "Followers",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
        Text(
          count,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
