import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zynk/core/routes/app_routes.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';

class MediaController extends GetxController {
  final ImagePicker _picker = ImagePicker();

  Future<void> pickVideo(ImageSource src) async {
    try {
      final XFile? video = await _picker.pickVideo(source: src);

      if (video != null) {
        Get.toNamed(AppRoutes.videopost);
      } else {
        Get.snackbar(
          "Alert",
          "Please pick a video to continue",
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Something went wrong while picking the video",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.redColor,
        colorText: AppColors.whiteColor,
      );
    }
  }
}
