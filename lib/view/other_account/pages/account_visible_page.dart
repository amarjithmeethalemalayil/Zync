import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zynk/controller/find_other_account/find_other_account_controller.dart';
import 'package:zynk/core/common/widgets/build_follow_section.dart';
import 'package:zynk/core/common/widgets/build_profile_circle.dart';
import 'package:zynk/core/common/widgets/commone_app_bar.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';
import 'package:zynk/view/other_account/widgets/follow_button.dart';

class AccountVisiblePage extends StatelessWidget {
  const AccountVisiblePage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>? ?? {};
    final uid = args['uid'] as String? ?? '';
    final ctrl = Get.find<FindOtherAccountController>();
    if (uid.isNotEmpty) {
      Future.microtask(() => ctrl.findUser(uid));
    }
    return Scaffold(
      appBar: CommonAppBar(),
      body: Obx(() {
        if (ctrl.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (uid.isEmpty || ctrl.user == null) {
          return const Center(child: Text("User not found"));
        }
        final user = ctrl.user!;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BuildProfileCircle(name: user.name),
              const SizedBox(height: 10),
              BuildFollowSection(
                followCount: ctrl.followingCount.value.toString(),
                followersCount: user.followers.length.toString(),
              ),
              const SizedBox(height: 30),
              FollowButton(
                btnColor: ctrl.isFollowing.value
                    ? AppColors.specialColor
                    : AppColors.secondaryColor,
                followUnfollow: () => ctrl.findUser(uid),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.collections_bookmark, size: 40),
                  SizedBox(width: 15),
                  Text(
                    "Your Creation",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Divider(thickness: 3),
            ],
          ),
        );
      }),
    );
  }
}
