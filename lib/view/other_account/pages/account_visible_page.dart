import 'package:flutter/material.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';
import 'package:zynk/core/common/widgets/commone_app_bar.dart';
import 'package:zynk/core/common/widgets/build_follow_section.dart';
import 'package:zynk/core/common/widgets/build_profile_circle.dart';

class AccountVisiblePage extends StatelessWidget {
  const AccountVisiblePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          child: Column(
            spacing: 10.0,
            children: [
              BuildProfileCircle(name: "name"),
              BuildFollowSection(count: "500"),
              SizedBox(height: 30.0),
              Container(
                height: 60.0,
                width: double.infinity,
                color: AppColors.secondaryColor,
                child: Center(
                  child: Text("Follow"),
                ),
              ),
              SizedBox(height: 25.0),
              _buildCollectionSection(),
              Divider(
                thickness: 3.0,
              )
            ],
          ),
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
}
