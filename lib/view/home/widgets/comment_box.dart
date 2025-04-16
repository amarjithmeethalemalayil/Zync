import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zynk/core/common/widgets/app_text_field.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';

class CommentBox {
  static void commentBox({
    required Widget child,
    required Function()? tapSend,
    required TextEditingController commentController,
  }) {
    Get.bottomSheet(
      Container(
        width: double.infinity,
        height: 500.0,
        decoration: const BoxDecoration(
          color: AppColors.specialBoxColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 10.0,
            ),
            Container(
              alignment: Alignment.topCenter,
              height: 5.0,
              width: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: AppColors.whiteColor,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            child,
            Container(
              padding: EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: AppTextField(
                      hintText: "Comment",
                      prefixIcon: Icon(Icons.comment),
                      controller: commentController,
                    ),
                  ),
                  InkWell(
                    onTap: tapSend,
                    child: Icon(
                      Icons.send,
                      color: AppColors.secondaryColor,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }
}
