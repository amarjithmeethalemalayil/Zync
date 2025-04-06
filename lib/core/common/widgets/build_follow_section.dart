import 'package:flutter/material.dart';

class BuildFollowSection extends StatelessWidget {
  final String count;

  const BuildFollowSection({
    super.key,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10.0,
      children: [
        _buildFloowFollowers(context: context, following: false),
        _buildFloowFollowers(context: context, following: false),
      ],
    );
  }

  Widget _buildFloowFollowers({
    required BuildContext context,
    required bool following,
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
