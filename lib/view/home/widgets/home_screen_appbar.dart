import 'package:flutter/material.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';

class HomeScreenAppbar extends StatelessWidget implements PreferredSizeWidget {
  final  Function()? leadingIconTapped;
  const HomeScreenAppbar({super.key, this.leadingIconTapped});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: _leadingIcon(),
      backgroundColor: AppColors.transparentColor,
    );
  }

  Widget _leadingIcon() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 20.0),
      child: GestureDetector(
        onTap: leadingIconTapped,
        child: CircleAvatar(
          child: Center(
            child: Icon(Icons.menu),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
