import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zynk/core/constants/local_remote_helper/local_remote_helper.dart';
import 'package:zynk/service/local/local_data_service.dart';
import '../routes/app_routes.dart';

class OnboardingMiddleware extends GetMiddleware {
  final LocalDataService localDataService = Get.find<LocalDataService>();

  @override
  RouteSettings? redirect(String? route) {
    bool onboardingCompleted = localDataService.getBool(key: LocalRemoteHelper.onboarded);
    return onboardingCompleted ? RouteSettings(name: AppRoutes.login) : null;
  }
}
