import 'package:flutter/material.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';
import 'package:zynk/view/home/pages/about_us_page.dart';
import 'package:zynk/view/home/pages/create_one_page.dart';
import 'package:zynk/view/home/pages/user_collection_page.dart';
import 'package:zynk/view/home/widgets/build_profile_circle.dart';
import 'package:zynk/view/home/widgets/log_out_button.dart';
import 'package:zynk/view/home/widgets/silver_view_options.dart';

class SliderViewPage extends StatefulWidget {
  final Function()? onPressed;
  const SliderViewPage({super.key, this.onPressed});

  @override
  State<SliderViewPage> createState() => _SliderViewPageState();
}

class _SliderViewPageState extends State<SliderViewPage> {
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
            BuildProfileCircle(name: "name"),
            SilverViewOptions(
              icon: Icons.video_chat_rounded,
              label: "Your Collection",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserCollectionPage(),
                ),
              ),
            ),
            SilverViewOptions(
              icon: Icons.camera_enhance_rounded,
              label: "Create One",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateOnePage(),
                ),
              ),
            ),
            SilverViewOptions(
              icon: Icons.pageview_outlined,
              label: "About me",
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutUsPage(),
                ),
              ),
            ),
            Spacer(),
            LogOutButton(),
          ],
        ),
      ),
    );
  }
}
