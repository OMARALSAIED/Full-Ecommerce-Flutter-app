
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class HomeController extends GetxController {
 static HomeController get Instanc=> Get.find();

 final carousalCurrentInedx=0.obs;

 void updatePageIndicator(index)
 {
  carousalCurrentInedx.value=index;
 }
}