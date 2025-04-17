import 'package:get/get.dart';

class SliderController extends GetxController {
  var isCollapsed = true.obs;

  void toggleCollapse() {
    isCollapsed.value = !isCollapsed.value;
  }
  void reset(){
    isCollapsed.value = true;
  }
}
