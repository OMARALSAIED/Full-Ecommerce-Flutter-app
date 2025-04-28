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
    sendEmailVerification();
    setTimerforAutoRedirect();
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

   late Timer _timer;



  setTimerforAutoRedirect() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SuccessScreen(
            image: TImage.accepted,
            buttontitle: TText.continueButton,
            title: TText.verificationSuccess,
            subtitle: TText.verified,
            onPressed: () => AuthenticationRepositry.instance.screenRedirect(),
          ),
        );
      }
    });
  }

  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    await currentUser?.reload();
    if (currentUser != null && currentUser.emailVerified) {
      if (_timer.isActive) _timer.cancel();
      Get.off(
        () => SuccessScreen(
          buttontitle: TText.loginNow,
          image: TImage.accepted,
          title: TText.verificationSuccess,
          subtitle: TText.successsubtitle,
          onPressed: () => AuthenticationRepositry.instance.screenRedirect(),
        ),
      );
    }
  }

  @override
  void onClose() {
    if (_timer.isActive) {
      _timer.cancel();
    }
    super.onClose();
  }
}