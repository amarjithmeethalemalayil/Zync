import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zynk/controller/add_video/media_controller.dart';
import 'package:zynk/controller/auth/auth_controller.dart';
import 'package:zynk/controller/find_other_account/find_other_account_controller.dart';
import 'package:zynk/controller/home_slider/slider_controller.dart';
import 'package:zynk/controller/home_video/home_video_controller.dart';
import 'package:zynk/controller/onboarding/onboarding_controller.dart';
import 'package:zynk/controller/search/search_controller.dart';
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

    await Supabase.initialize(
      url: "https://tnjurhgopykaorxpgkgd.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRuanVyaGdvcHlrYW9yeHBna2dkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI2Mjc2NzYsImV4cCI6MjA1ODIwMzY3Nn0.uaTVm9a-EPcqtJ5XhknvRB0zVYIlnfsQ568CL8mPkwI",
    );

    final supabaseClient = Supabase.instance.client;
    final auth = FirebaseAuth.instance;
    final db = FirebaseFirestore.instance;
    final gauth = GoogleSignIn();
    Get.put(LocalDataService(prefs), permanent: true);
    Get.put(AuthService(auth: auth, db: db, gSignIn: gauth));
    Get.put(MySearchController(auth, db), permanent: true);
    Get.put(FindOtherAccountController(auth, db), permanent: true);
    Get.lazyPut(() =>
        AuthController(authService: Get.find(), localDataService: Get.find()));
    Get.lazyPut(() => OnboardingController(localStorageService: Get.find()));
    Get.put(SliderController());
    Get.lazyPut(() => HomeVideoController(auth: auth, db: db));
    Get.lazyPut(
        () => MediaController(db: db, auth: auth, client: supabaseClient));
  }
}
