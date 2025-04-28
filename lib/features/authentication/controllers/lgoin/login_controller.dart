import 'package:ecommerce/common/wigets/internet/network_manger.dart';
import 'package:ecommerce/data/repositories/auth/authentication_repositry.dart';
import 'package:ecommerce/util/constants/images_strings.dart';
import 'package:ecommerce/util/popups/full_screen_loader.dart';
import 'package:ecommerce/util/popups/loader.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final hidPassword = true.obs;
  final remeberMe = false.obs;
  final localstorge=GetStorage();

  final  email=TextEditingController();
  final  password=TextEditingController();
  GlobalKey<FormState> globalKey=GlobalKey<FormState>();

  @override
  void onInit()
  {
    super.onInit();
    email.text=localstorge.read('REMEBER_ME_EMAIL');
    password.text=localstorge.read('REMEBER_ME_PASSWORD');
  }


  Future<void> emailAndPasswordSignin()async
  {
    try{
      FullScreenLoader.openLoadingDiloG('Logging you in', TImage.loading);
      // Check internet
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
     FullScreenLoader.stopLoading();
      return;
    }



    // Form Validation
    if (!globalKey.currentState!.validate()) {
      FullScreenLoader.stopLoading();
      return;
    }


    // Check Privacy Policy
    if (remeberMe.value) {
    
      localstorge.write('REMEBER_ME_EMAIL',  email.text.trim());
      localstorge.write('REMEBER_ME_PASSWORD',  password.text.trim());
      
    }
    final userCredential =await AuthenticationRepositry.instance.loginWithemailAndPassword(email.text.trim(), password.text.trim());

    FullScreenLoader.stopLoading();
    AuthenticationRepositry.instance.screenRedirect();

    }catch(e)
  {
    FullScreenLoader.stopLoading();
    Loader.errorSnackbar(e.toString(), 'Oh Snap!');
  }
  } 

}