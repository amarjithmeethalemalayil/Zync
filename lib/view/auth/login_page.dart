import 'package:flutter/material.dart';
import 'package:zynk/constants/assets/asset_helper.dart';
import 'package:zynk/constants/theme/colors/app_colors.dart';
import 'package:zynk/view/home/slider_handle_page.dart';
import 'package:zynk/view/home/video_view_page.dart';
import 'package:zynk/view/widgets/app_text_field.dart';
import 'package:zynk/view/widgets/full_screen_image_box.dart';
import 'package:zynk/view/widgets/my_button.dart';
import 'package:zynk/view/widgets/my_divider.dart';
import 'package:zynk/view/widgets/sign_up_row.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FullScreenImageBox(
            imagePath: AssetHelper.onboardingImageTwo,
          ),
          Positioned(
            bottom: 20.0,
            left: 13.0,
            right: 13.0,
            child: Container(
              height: 500.0,
              width: 375.0,
              decoration: BoxDecoration(
                color: AppColors.specialColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 45.0,
                    vertical: 27.0,
                  ),
                  child: Column(
                    spacing: 16.0,
                    children: [
                      Text(
                        "Sign In",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 24.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      AppTextField(
                        hintText: "Enter your Email",
                        prefixIcon: Icon(
                          Icons.alternate_email_outlined,
                          size: 28.0,
                        ),
                      ),
                      AppTextField(
                        hintText: "Enter your Password",
                        prefixIcon: Icon(
                          Icons.lock_outline_rounded,
                          size: 28.0,
                        ),
                      ),
                      SizedBox(),
                      MyButton(
                        buttonText: "Sign In",
                        buttonHeight: 46.0,
                        buttonWidth: 284.0,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SliderHandlePage(),
                          ),
                        ),
                      ),
                      Text(
                        "Forgot Password?",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.secondaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      MyDivider(),
                      SignUpRow()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
