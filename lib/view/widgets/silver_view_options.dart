import 'package:flutter/material.dart';

class SilverViewOptions extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function()? onTap;
  const SilverViewOptions({super.key, required this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: InkWell(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              spacing: 10.0,
              children: [
                SizedBox(
                  height: 20.0,
                  width: 20.0,
                  child: Icon(icon),
                ),
                Text(label),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 200.0,
          child: Divider(),
        ),
      ],
    );
  }
}
