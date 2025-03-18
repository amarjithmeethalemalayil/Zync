import 'package:flutter/material.dart';
import 'package:zynk/view/common/widgets/commone_app_bar.dart';

class UserCollectionPage extends StatelessWidget {
  const UserCollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      body: Center(
        child: Text("User collection"),
      ),
    );
  }
}
