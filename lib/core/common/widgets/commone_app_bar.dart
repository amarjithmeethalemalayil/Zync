import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      leading: BackButton(
        onPressed: () => Get.back(),
        color: AppColors.whiteColor,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56); 
}
