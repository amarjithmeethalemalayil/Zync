import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zynk/core/constants/local_remote_helper/local_remote_helper.dart';
import 'package:zynk/core/routes/app_routes.dart';
import 'package:zynk/service/local/local_data_service.dart';

class LoginMiddleware extends GetMiddleware {
  final LocalDataService localDataService = Get.find<LocalDataService>();

    @override
  RouteSettings? redirect(String? route) {
    bool loggedIn = localDataService.getBool(key: LocalRemoteHelper.loggedIn);
    return loggedIn ? RouteSettings(name: AppRoutes.home) : null;
  }
}
