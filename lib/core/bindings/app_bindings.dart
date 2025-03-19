import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zynk/controller/add_video/media_controller.dart';
import 'package:zynk/controller/auth/auth_controller.dart';
import 'package:zynk/controller/onboarding/onboarding_controller.dart';
import 'package:zynk/firebase_options.dart';
import 'package:zynk/service/local/local_data_service.dart';
import 'package:zynk/service/remote/auth_service.dart';

class AppBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    WidgetsFlutterBinding.ensureInitialized();
    final prefs = await SharedPreferences.getInstance();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    final auth = FirebaseAuth.instance;
    final db = FirebaseFirestore.instance;
    final gauth = GoogleSignIn();
    Get.put(LocalDataService(prefs), permanent: true);
    Get.put(AuthService(auth: auth, db: db, gSignIn: gauth));
    Get.lazyPut(() => AuthController(
          authService: Get.find(),
          localDataService: Get.find(),
        ));
    Get.lazyPut(() => OnboardingController(localStorageService: Get.find()));
    Get.lazyPut(() => MediaController());
  }
}
