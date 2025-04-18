import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zynk/controller/find_other_account/find_other_account_controller.dart';
import 'package:zynk/core/common/widgets/build_follow_section.dart';
import 'package:zynk/core/common/widgets/build_profile_circle.dart';
import 'package:zynk/core/common/widgets/commone_app_bar.dart';
import 'package:zynk/core/routes/app_routes.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';
import 'package:zynk/model/video_model.dart';
import 'package:zynk/view/other_account/widgets/follow_button.dart';
import 'package:zynk/core/common/widgets/video_collection_small_box.dart';
import 'package:zynk/core/common/widgets/video_collection_small_error_box.dart';

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
      body: Obx(
        () {
          if (ctrl.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (uid.isEmpty || ctrl.user == null) {
            return const Center(child: Text("User not found"));
          }
          final user = ctrl.user!;
          return SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BuildProfileCircle(name: user.name),
                const SizedBox(height: 10),
                BuildFollowSection(
                  followCount: user.following.length.toString(),
                  followersCount: user.followers.length.toString(),
                ),
                const SizedBox(height: 30),
                Obx(() {
                  return FollowButton(
                    btnColor: ctrl.isFollowing.value
                        ? AppColors.specialColor
                        : AppColors.secondaryColor,
                    followUnfollow: () async {
                      await ctrl.followUser(uid);
                    },
                  );
                }),
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
                const SizedBox(height: 10),
                GridView.builder(
                  padding: const EdgeInsets.only(top: 10),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: user.uploadedVideos.length,
                  itemBuilder: (context, index) {
                    final videoDocId = user.uploadedVideos[index];
                    return FutureBuilder<Video?>(
                      future: ctrl.findVideoCollection(videoDocId),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError || !snapshot.hasData) {
                          return VideoCollectionSmallErrorBox();
                        }
                        final video = snapshot.data!;
                        return VideoCollectionSmallBox(
                          thumbnail: video.thumbnail,
                          collectionPressed: () => Get.toNamed(
                              AppRoutes.collectionVideoShowPage,
                              arguments: video),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
