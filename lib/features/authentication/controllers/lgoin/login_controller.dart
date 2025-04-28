import 'package:ecommerce/common/wigets/internet/network_manger.dart';
import 'package:ecommerce/data/repositories/auth/authentication_repositry.dart';
import 'package:ecommerce/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce/util/constants/images_strings.dart';
import 'package:ecommerce/util/popups/full_screen_loader.dart';
import 'package:ecommerce/util/popups/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final hidPassword = true.obs;
  final remeberMe = false.obs;
  final localstorge = GetStorage();

  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    super.onInit();
    email.text = localstorge.read('REMEBER_ME_EMAIL') ?? '';
    password.text = localstorge.read('REMEBER_ME_PASSWORD') ?? '';
  }

  // Google SignIn
 final GoogleSignIn _googleSignIn = GoogleSignIn();

Future<UserCredential?> signInWithGoogle() async {
  try {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      await _googleSignIn.signInSilently();
    }
    
    final GoogleSignInAccount? userAccount = await _googleSignIn.signIn();
    if (userAccount == null) return null;
    
    final GoogleSignInAuthentication googleAuth = await userAccount.authentication;
    
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    
    final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

    /// 👇 حل المشكلة هنا
    AuthenticationRepositry.instance.screenRedirect();

    return userCredential;
  } catch (e) {
    print('Google Sign-In Error: $e');
    rethrow;
  }
}
 

  //Email And Password sign in

  Future<void> emailAndPasswordSignin() async {
    try {
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
        localstorge.write('REMEBER_ME_EMAIL', email.text.trim());
        localstorge.write('REMEBER_ME_PASSWORD', password.text.trim());
      }
      final userCredential = await AuthenticationRepositry.instance
          .loginWithemailAndPassword(email.text.trim(), password.text.trim());

      FullScreenLoader.stopLoading();
      AuthenticationRepositry.instance.screenRedirect();
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loader.errorSnackbar(e.toString(), 'Oh Snap!');
    }
  }
}
