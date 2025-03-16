import 'package:flutter/material.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: Row(
        spacing: 10.0,
        children: [
          Icon(Icons.logout),
          Text("Logout"),
        ],
      ),
    );
  }
}
