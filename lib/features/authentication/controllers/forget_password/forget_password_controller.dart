import 'package:ecommerce/common/wigets/internet/network_manger.dart';
import 'package:ecommerce/data/repositories/auth/authentication_repositry.dart';
import 'package:ecommerce/features/authentication/screens/password_configuration/resetPassowrd.dart';
import 'package:ecommerce/util/constants/images_strings.dart';
import 'package:ecommerce/util/popups/full_screen_loader.dart';
import 'package:ecommerce/util/popups/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  final email = TextEditingController();

  GlobalKey<FormState> forgetpasswordformkey = GlobalKey<FormState>();

  sedPasswordResetEmail() async {
    try {
      FullScreenLoader.openLoadingDiloG('Processing Your request...', TImage.loading);
      final isConnected=await  NetworkManager.instance.isConnected();
      if(!isConnected)
      {
        FullScreenLoader.stopLoading();
        return;
      }
      if(!forgetpasswordformkey.currentState!.validate())
      {
        FullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepositry.instance.sendPasswordResetEmail(email.text.trim());

      FullScreenLoader.stopLoading();
      Loader.successSnackbar('Email Link Sent to Reset your Password', 'email sent');

      Get.to(()=>Resetpassowrd(email: email.text.trim(),));
    } catch (e) {
      Loader.errorSnackbar(e.toString(), 'oh Snap! ');
    }
  }

  resendPasswordResetemail(String  email) async {
    try {
      FullScreenLoader.openLoadingDiloG('Processing Your request...', TImage.loading);
      final isConnected=await  NetworkManager.instance.isConnected();
      if(!isConnected)
      {
        FullScreenLoader.stopLoading();
        return;
      }
    
      await AuthenticationRepositry.instance.sendPasswordResetEmail(email);

      FullScreenLoader.stopLoading();
      Loader.successSnackbar('Email Link Sent to Reset your Password', 'email sent');

      Get.to(()=>Resetpassowrd(email: email));
    } catch (e) {
      Loader.errorSnackbar(e.toString(), 'oh Snap! ');
    }
  }
}
