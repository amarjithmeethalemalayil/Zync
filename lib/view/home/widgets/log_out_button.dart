import 'package:flutter/material.dart';

class LogOutButton extends StatelessWidget {
  final Function()? logOutPressed;
  const LogOutButton({super.key, this.logOutPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: InkWell(
        onTap: logOutPressed,
        child: Row(
          spacing: 10.0,
          children: [
            Icon(Icons.logout),
            Text("Logout"),
          ],
        ),
      ),
    );
  }
}
