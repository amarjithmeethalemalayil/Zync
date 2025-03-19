import 'package:get/get.dart';
import 'package:zynk/core/constants/local_remote_helper/local_remote_helper.dart';
import 'package:zynk/core/routes/app_routes.dart';
import 'package:zynk/service/local/local_data_service.dart';
import 'package:zynk/service/remote/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:zynk/view/common/widgets/loading.dart';

class AuthController extends GetxController {
  final AuthService authService;
  final LocalDataService localDataService;
  AuthController({
    required this.authService,
    required this.localDataService,
  });

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> _setLoggedIn() async {
    await localDataService.setBool(
      key: LocalRemoteHelper.loggedIn,
      value: true,
    );
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    Get.dialog(
      Loading(),
      barrierDismissible: false,
    );
    if (email.isEmpty || password.isEmpty) {
      Get.back();
      Get.snackbar("Alert", "Fill all the fields");
      return;
    }
    final result = await authService.signIn(email: email, password: password);
    Get.back();
    result.fold(
      (onFailure) => Get.snackbar("Login Error", onFailure.message),
      (onSuccess) {
        _setLoggedIn();
        Get.offAllNamed(AppRoutes.home);
        emailController.clear();
      },
    );
  }

  Future<void> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    Get.dialog(
      Loading(),
      barrierDismissible: false,
    );
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      Get.back();
      Get.snackbar("Alert", "Fill all the fields");
      return;
    }
    final result = await authService.signUp(
      name: name,
      email: email,
      password: password,
    );
    Get.back();
    result.fold(
      (onFailure) => Get.snackbar("Register Error", onFailure.message),
      (onSuccess) {
        _setLoggedIn();
        Get.offAllNamed(AppRoutes.home);
        emailController.clear();
      },
    );
  }

  Future<void> googleSignIn() async {
    final response = await authService.signInWithGoogle();
    response.fold(
      (onFailure) => Get.snackbar("Register Error", onFailure.message),
      (onSuccess) {
        _setLoggedIn();
        Get.offAllNamed(AppRoutes.home);
      },
    );
  }

  Future<void> signOut() async {
    try {
      await authService.signOut();
      Get.offAllNamed(AppRoutes.login);
    } catch (e) {
      Get.snackbar("Sign Out Error", e.toString());
    }
  }

  Future<void> forgotPassword({required String email}) async {
    if (email.isEmpty) {
      Get.snackbar("Alert", "Please enter your email");
      return;
    }

    Get.dialog(
      Loading(),
      barrierDismissible: false,
    );

    final result =
        await authService.forgotPassword(email: emailController.text.trim());

    Get.back();

    result.fold(
      (onFailure) => Get.snackbar("Reset Error", onFailure.message),
      (onSuccess) {
        Get.snackbar("Success", "Password reset email sent. Check your inbox!");
        emailController.clear();
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }
}
