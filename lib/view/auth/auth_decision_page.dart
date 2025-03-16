import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:zynk/constants/assets/asset_helper.dart';
import 'package:zynk/constants/theme/colors/app_colors.dart';
import 'package:zynk/view/auth/login_page.dart';
import 'package:zynk/view/auth/sign_up_page.dart';
import 'package:zynk/view/widgets/full_screen_image_box.dart';
import 'package:zynk/view/widgets/login_selecting_box.dart';
import 'package:zynk/view/widgets/my_button.dart';
import 'package:zynk/view/widgets/my_divider.dart';

class AuthDecisionPage extends StatelessWidget {
  const AuthDecisionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FullScreenImageBox(
            imagePath: AssetHelper.loginSelectionPageBgImage,
          ),
          Positioned(
            bottom: 20.0,
            left: 13.0,
            right: 13.0,
            child: Container(
              height: 450.0,
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
                        "Get Started",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 24.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      LoginSelectingBox(
                        imagePath: AssetHelper.googleLogo,
                        text: "Sign in with Google",
                      ),
                      LoginSelectingBox(
                        imagePath: AssetHelper.fbLogo,
                        text: "Sign in with Facebook",
                      ),
                      LoginSelectingBox(
                        imagePath: AssetHelper.appleLogo,
                        text: "Sign in with Apple",
                      ),
                      MyDivider(),
                      MyButton(
                        buttonText: "Sign in with password",
                        buttonHeight: 60.0,
                        buttonWidth: 352.0,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        ),
                      ),
                      _buildSignUpText(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpPage(),
                                ),
                              ),
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

  Widget _buildSignUpText({required GestureRecognizer recognizer}) {
    return RichText(
      text: TextSpan(
        text: "Don't have an account? ",
        style: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 16.0,
        ),
        children: [
          TextSpan(
            text: "Sign up",
            style: TextStyle(
              color: AppColors.secondaryColor,
              fontWeight: FontWeight.bold,
            ),
            recognizer: recognizer,
          ),
        ],
      ),
    );
  }
}
