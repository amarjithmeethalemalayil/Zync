import 'package:get/get.dart';
import 'package:zynk/core/constants/local_remote_helper/local_remote_helper.dart';
import 'package:zynk/core/routes/app_routes.dart';
import 'package:zynk/service/local/local_data_service.dart';

class OnboardingController extends GetxController {
  final LocalDataService localStorageService;
  OnboardingController({required this.localStorageService});
  Future<void> completeOnboarding() async {
    await localStorageService.setBool(
      key: LocalRemoteHelper.onboarded,
      value: true,
    );
    Get.offAllNamed(AppRoutes.login);
  }
}
