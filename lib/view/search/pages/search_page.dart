import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zynk/controller/search/search_controller.dart';
import 'package:zynk/core/common/widgets/app_text_field.dart';
import 'package:zynk/core/common/widgets/commone_app_bar.dart';
import 'package:zynk/core/routes/app_routes.dart';
import 'package:zynk/view/search/widgets/searched_user_box.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchController = TextEditingController();
  final controller = Get.find<MySearchController>();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            AppTextField(
              hintText: "Search",
              prefixIcon: Icon(Icons.search),
              controller: _searchController,
              onFieldSubmitted: (val) {
                final input = val.trim();
                controller.searchUser(input);
              },
            ),
            Obx(() {
              if (controller.searchedUsers.isEmpty) {
                return Expanded(
                  child: Center(
                    child: Text(
                      'No results found',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                );
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: controller.searchedUsers.length,
                  itemBuilder: (context, index) {
                    final user = controller.searchedUsers[index];
                    return SearchedUserBox(
                      username: user.name,
                      onTapSearchedUser: () => Get.toNamed(
                        AppRoutes.accountVisiblePage,
                        arguments: {'uid': user.uid},
                      ),
                    );
                  },
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
