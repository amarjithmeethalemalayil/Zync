import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';

class ShowVideoUploadLoading {
  static void showLoadingDialog() {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 10),
              Text(
                "Uploading Video...",
                style: TextStyle(
                  color: AppColors.whiteColor,
                ),
              )
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
