import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zynk/controller/auth/auth_controller.dart';
import 'package:zynk/core/theme/colors/app_colors.dart';
import 'package:zynk/core/common/widgets/app_text_field.dart';
import 'package:zynk/core/common/widgets/commone_app_bar.dart';
import 'package:zynk/core/common/widgets/my_button.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final controller = Get.find<AuthController>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10.0,
          children: [
            Text(
              "Forgot Password",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              "Please Enter your email address. You will receive a link to create a new password",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.whiteColor,
                  ),
            ),
            SizedBox(
              height: 20.0,
            ),
            AppTextField(
              hintText: "Email",
              prefixIcon: Icon(
                Icons.alternate_email_outlined,
                size: 28.0,
              ),
              controller: _emailController,
            ),
            SizedBox(
              height: 10.0,
            ),
            Align(
              alignment: Alignment.center,
              child: MyButton(
                buttonText: "Next",
                buttonHeight: 46.0,
                buttonWidth: 287.0,
                onTap: () => controller.forgotPassword(
                  email: _emailController.text.trim(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
