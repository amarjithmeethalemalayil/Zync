import 'package:get/get.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';

class ShowErrorSnackBar {
  static void showErrorSnackbar(String message) {
    Get.snackbar(
      "Error",
       message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.redColor,
      colorText: AppColors.whiteColor,
    );
  }
}
