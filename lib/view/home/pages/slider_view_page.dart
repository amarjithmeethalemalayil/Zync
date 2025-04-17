import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zynk/controller/user_info/user_info_controller.dart';
import 'package:zynk/core/routes/app_routes.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';
import 'package:zynk/core/common/widgets/build_profile_circle.dart';
import 'package:zynk/view/home/widgets/log_out_button.dart';
import 'package:zynk/view/home/widgets/silver_view_options.dart';

class SliderViewPage extends StatefulWidget {
  final Function()? onPressed;
  const SliderViewPage({super.key, this.onPressed});

  @override
  State<SliderViewPage> createState() => _SliderViewPageState();
}

class _SliderViewPageState extends State<SliderViewPage> {
  final UserInfoController userInfoController = Get.put(UserInfoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: widget.onPressed,
          icon: Icon(
            Icons.close,
            color: AppColors.whiteColor,
            size: 30.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 30.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 60.0,
                ),
                child: BuildProfileCircle(
                  name: userInfoController.username.value,
                ),
              ),
            ),
            SilverViewOptions(
              icon: Icons.search,
              label: "Search",
              onTap: () => Get.toNamed(AppRoutes.searchPage),
            ),
            SilverViewOptions(
              icon: Icons.video_chat_rounded,
              label: "Your Account",
              onTap: () => Get.toNamed(AppRoutes.myCollection),
            ),
            SilverViewOptions(
              icon: Icons.camera_enhance_rounded,
              label: "Create One",
              onTap: () => Get.toNamed(AppRoutes.createOne),
            ),
            SilverViewOptions(
              icon: Icons.pageview_outlined,
              label: "About me",
              onTap: () => Get.toNamed(AppRoutes.createOne),
            ),
            Spacer(),
            LogOutButton(),
          ],
        ),
      ),
    );
  }
}
