import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:zynk/controller/add_video/media_controller.dart';
import 'package:zynk/core/constants/assets/asset_helper.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';
import 'package:zynk/core/common/widgets/commone_app_bar.dart';
import 'package:zynk/view/create_one/widgets/special_button.dart';

class CreateOnePage extends GetView<MediaController> {
  const CreateOnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              child: Lottie.asset(AssetHelper.createOneAnimation),
            ),
            const SizedBox(height: 20),
            Text(
              "Post New Zynk Video",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              "Choose an option for your post",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.specialBoxColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            SpecialButton(
              onTap: () => controller.pickVideo(ImageSource.camera),
              icon: Icon(Icons.camera, color: AppColors.whiteColor),
              text: "Shoot",
            ),
            const SizedBox(height: 15),
            SpecialButton(
              onTap: () => controller.pickVideo(ImageSource.gallery),
              icon: Icon(Icons.image, color: AppColors.whiteColor),
              text: "Choose from Gallery",
            ),
          ],
        ),
      ),
    );
  }
}
