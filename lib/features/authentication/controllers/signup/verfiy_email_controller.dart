import 'dart:async';

import 'package:ecommerce/common/wigets/success_screen/success_screen.dart';
import 'package:ecommerce/data/repositories/auth/authentication_repositry.dart';
import 'package:ecommerce/util/constants/images_strings.dart';
import 'package:ecommerce/util/constants/text_strings.dart';
import 'package:ecommerce/util/popups/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerfiyEmailController extends GetxController {
  static VerfiyEmailController get instance => Get.find();

  @override
  void onInit() {
    setTimerforAutoRedirect();
    sendEmailVerification();
    super.onInit();
  }

  ///Send email Verification link

  void sendEmailVerification() async {
    try {
      await AuthenticationRepositry.instance.sendEmailVerification();
      Loader.successSnackbar(
        'Please Check your inbox and verifiy your email',
        'Email Sent',
      );
    } catch (e) {
      Loader.errorSnackbar(e.toString(), 'Oh Snap!');
    }
  }

  /// Time to acutomatically an Email Verification
  ///
  setTimerforAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          SuccessScreen(
            image: TImage.success,
            title: TText.verificationSuccess,
            subtitle: TText.verified,
            onPressed: () => AuthenticationRepositry.instance.screenRedirect(),
          ),
        );
      }
    });
  }

  ///Manualy Check if Email Verifed
  checkEmailVerificationStatus()async
  {
    final currentUser =FirebaseAuth.instance.currentUser;
    if(currentUser !=null && currentUser.emailVerified)
    {
       Get.off(
          SuccessScreen(
            image: TImage.success,
            title: TText.verificationSuccess,
            subtitle: TText.verified,
            onPressed: () => AuthenticationRepositry.instance.screenRedirect(),
          ),
        );
    }
  }
}
