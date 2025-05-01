import 'package:ecommerce/common/wigets/internet/network_manger.dart';
import 'package:ecommerce/data/repositories/user/user_repository.dart';
import 'package:ecommerce/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce/features/personalization/screens/Profile/profile.dart';
import 'package:ecommerce/util/constants/images_strings.dart';

import 'package:ecommerce/util/popups/full_screen_loader.dart';
import 'package:ecommerce/util/popups/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  GlobalKey<FormState> UpdateNameForkey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializedNamnes();
    super.onInit();
  }

  Future<void> initializedNamnes() async {
    firstname.text = userController.user.value.firstName;
    lastname.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      FullScreenLoader.openLoadingDiloG('We are Updating your information', TImage.loading);
      // Check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

  
      Map<String,dynamic> name={'FirstName' :firstname.text.trim(),'LasttName' :lastname.text.trim()};
      await userRepository.updateSingleFiled(name);
       userController.user.value.firstName=firstname.text.trim();
     userController.user.value.lastName=lastname.text.trim();
    FullScreenLoader.stopLoading();
    Loader.successSnackbar('Your Name has been Updated', 'Congratulations');
    Get.off(()=>const Porfile());
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loader.errorSnackbar(e.toString(), 'Oh Snap!');
    }
  }
}
