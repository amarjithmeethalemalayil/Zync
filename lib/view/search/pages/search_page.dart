import 'package:flutter/material.dart';
import 'package:zynk/core/common/widgets/app_text_field.dart';
import 'package:zynk/core/common/widgets/commone_app_bar.dart';
import 'package:zynk/view/other_account/pages/account_visible_page.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return Scaffold(
      appBar: CommonAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            AppTextField(
              hintText: "Search",
              prefixIcon: Icon(Icons.search),
              controller: searchController,
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => AccountVisiblePage()));
                },
                icon: Icon(Icons.next_plan))
          ],
        ),
      ),
    );
  }
}
