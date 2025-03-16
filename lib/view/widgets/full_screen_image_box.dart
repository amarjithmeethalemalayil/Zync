import 'package:flutter/material.dart';

class FullScreenImageBox extends StatelessWidget {
  final String imagePath;
  final Widget? child;
  const FullScreenImageBox({
    super.key,
    required this.imagePath,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
