import 'package:get/route_manager.dart';
import 'package:zynk/core/middleware/onboarding_middleware.dart';
import 'package:zynk/view/auth/pages/forgot_password_page.dart';
import 'package:zynk/view/auth/pages/login_page.dart';
import 'package:zynk/view/auth/pages/sign_up_page.dart';
import 'package:zynk/view/home/pages/about_us_page.dart';
import 'package:zynk/view/home/pages/create_one_page.dart';
import 'package:zynk/view/home/pages/slider_handle_page.dart';
import 'package:zynk/view/home/pages/user_collection_page.dart';
import 'package:zynk/view/onboarding/onboarding_page_one.dart';
import 'package:zynk/view/onboarding/onboarding_page_two.dart';

class AppRoutes {
  static const String onboarding = '/';
  static const String getStarted = '/get-started';
  static const String login = '/login';
  static const String signUp = '/signup'; 
  static const String forgotPassword = '/forgot-password';
  static const String home = '/home';
  static const String createOne = '/create-one';
  static const String about = '/about';
  static const String myCollection = '/my-collection';

  static String getInitialRoute() => onboarding;

  static List<GetPage> routes = [
    GetPage(
      name: onboarding,
      page: () => OnboardingPageOne(),
      middlewares: [OnboardingMiddleware()], 
    ),
    GetPage(name: getStarted, page: () => OnboardingPageTwo()),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: signUp, page: () => SignUpPage()), 
    GetPage(name: forgotPassword, page: () => ForgotPasswordPage()),
    GetPage(name: home, page: () => SliderHandlePage()),
    GetPage(name: createOne, page: () => CreateOnePage()),
    GetPage(name: about, page: () => AboutUsPage()),
    GetPage(name: myCollection, page: () => UserCollectionPage()),
  ];
}
