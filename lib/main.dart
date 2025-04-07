import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:zynk/core/bindings/app_bindings.dart';
import 'package:zynk/core/theme/theme/app_theme.dart';
import 'package:zynk/core/routes/app_routes.dart';

Future<void> main() async {
  await AppBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zynk',
      theme: AppTheme.appTheme,
      initialRoute: AppRoutes.getInitialRoute(),
      getPages: AppRoutes.routes,
    );
  }
}
