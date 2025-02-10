import 'package:flutter/material.dart';
import 'package:zynk/constants/assets/asset_helper.dart';

class AuthDecisionPage extends StatelessWidget {
  const AuthDecisionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetHelper.onboardingImageOne),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF393838),
              ),
              padding: EdgeInsets.only(
                top: 20.0
              ),
              child: Column(
                children: [
                  Text(
                    "Get Started",
                    style: Theme.of(context).textTheme.headlineSmall,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
