import 'package:ecommerce/common/wigets/internet/network_manger.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
   Get.put(NetworkManager());
  }
}