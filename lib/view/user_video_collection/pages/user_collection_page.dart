import 'package:flutter/material.dart';
import 'package:zynk/core/common/widgets/commone_app_bar.dart';
import 'package:zynk/core/common/widgets/build_follow_section.dart';
import 'package:zynk/core/common/widgets/build_profile_circle.dart';

class UserCollectionPage extends StatelessWidget {
  const UserCollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            BuildProfileCircle(name: "name"),
            BuildFollowSection(followCount: "500",followersCount: "100",),
            _space(30.0),
            _buildCollectionSection(),
            _space(10.0),
            Divider(
              thickness: 3.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCollectionSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 15.0,
      children: [
        Icon(
          Icons.collections_bookmark,
          size: 40.0,
        ),
        Text("Your Creation")
      ],
    );
  }

  Widget _space(double height) {
    return SizedBox(
      height: height,
    );
  }
}
