import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zynk/controller/current_user_profile/current_user_profile_controller.dart';
import 'package:zynk/core/common/widgets/commone_app_bar.dart';
import 'package:zynk/core/common/widgets/build_follow_section.dart';
import 'package:zynk/core/common/widgets/build_profile_circle.dart';
import 'package:zynk/core/routes/app_routes.dart';
import 'package:zynk/model/video_model.dart';
import 'package:zynk/core/common/widgets/video_collection_small_box.dart';
import 'package:zynk/core/common/widgets/video_collection_small_error_box.dart';

class UserCollectionPage extends StatelessWidget {
  const UserCollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CurrentUserProfileController>();

    return Scaffold(
      appBar: CommonAppBar(),
      body: Obx(() {
        final user = controller.userProfile.value;

        if (user == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              BuildProfileCircle(name: user.name),
              BuildFollowSection(
                followCount: user.following.length.toString(),
                followersCount: user.followers.length.toString(),
              ),
              _space(30.0),
              _buildCollectionSection(),
              _space(10.0),
              const Divider(thickness: 3.0),
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
                    future: controller.findVideoCollection(videoDocId),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError || !snapshot.hasData) {
                        return const VideoCollectionSmallErrorBox();
                      }
                      final video = snapshot.data!;
                      return VideoCollectionSmallBox(
                        thumbnail: video.thumbnail,
                        collectionPressed: () => Get.toNamed(
                          AppRoutes.currentUserVideoShowPage,
                          arguments: video,
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildCollectionSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.collections_bookmark, size: 40.0),
        SizedBox(width: 10),
        Text("Your Creation", style: TextStyle(fontSize: 18)),
      ],
    );
  }

  Widget _space(double height) => SizedBox(height: height);
}
