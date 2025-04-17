import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zynk/controller/auth/auth_controller.dart';
import 'package:zynk/core/constants/assets/asset_helper.dart';
import 'package:zynk/core/routes/app_routes.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';
import 'package:zynk/view/auth/widgets/build_selection_text.dart';
import 'package:zynk/view/auth/widgets/google_button.dart';
import 'package:zynk/view/auth/widgets/special_text.dart';
import 'package:zynk/core/common/widgets/app_text_field.dart';
import 'package:zynk/core/common/widgets/full_screen_image_box.dart';
import 'package:zynk/core/common/widgets/my_button.dart';
import 'package:zynk/view/auth/widgets/my_divider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Get.find<AuthController>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                        controller: _emailController,
                        hintText: "Enter your Email",
                        prefixIcon: Icon(
                          Icons.alternate_email_outlined,
                          size: 28.0,
                        ),
                      ),
                      AppTextField(
                        controller: _passwordController,
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
                        onTap: () => _login(),
                      ),
                      InkWell(
                        onTap: () => Get.toNamed(AppRoutes.forgotPassword),
                        child: SpecialText(content: "Forgot Password?"),
                      ),
                      MyDivider(),
                      GoogleButton(
                        onTap: () => _googleLogin(),
                      ),
                      BuildSelectionText(
                        onTap: () => Get.toNamed(AppRoutes.signUp),
                      )
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

  void _googleLogin() {
    controller.googleSignIn();
  }

  void _login() {
    controller.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }
}
