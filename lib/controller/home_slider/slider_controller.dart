import 'package:get/get.dart';

class SliderController extends GetxController {
  var isCollapsed = true.obs;
  var isExpanded = false.obs;

  void toggleCollapse() {
    isCollapsed.value = !isCollapsed.value;
  }

  void toggleExpand() {
    isExpanded.value = !isExpanded.value;
  }
}
