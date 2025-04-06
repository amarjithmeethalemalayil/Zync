import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zynk/core/constants/assets/asset_helper.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(AssetHelper.loading);
  }
}
