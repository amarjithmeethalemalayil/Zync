import 'package:flutter/material.dart';
import 'package:zynk/view/common/widgets/commone_app_bar.dart';

class CreateOnePage extends StatelessWidget {
  const CreateOnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      body: Center(
        child: Text("add one"),
      ),
    );
  }
}
