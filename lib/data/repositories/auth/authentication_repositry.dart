import 'package:ecommerce/features/authentication/screens/login/login.dart';
import 'package:ecommerce/features/authentication/screens/onborading/onborading.dart';
import 'package:ecommerce/features/authentication/screens/sigup/veryifyemail.dart';
import 'package:ecommerce/navigation_menu.dart';
import 'package:ecommerce/util/helpers/handelExpetions.dart';
import 'package:ecommerce/util/valdatores/auth_Exceptions.dart';
import 'package:ecommerce/util/valdatores/format_Exceptions.dart';
import 'package:ecommerce/util/valdatores/platform_Exceptioon.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepositry extends GetxController {
  static AuthenticationRepositry get instance => Get.find();

  final devicestorge = GetStorage();
  final _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  void screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      final updatedUser = _auth.currentUser; // استرجع التحديث الجديد بعد reload

      if (updatedUser != null && updatedUser.emailVerified) {
        Get.offAll(() => NavigationMenu());
      } else {
        Get.offAll(() => VeryifyEmail(email: updatedUser?.email));
      }
    } else {
      devicestorge.writeIfNull('isFristTime', true);
      final isFirstTime = devicestorge.read('isFristTime') ?? true;
      if (isFirstTime) {
        Get.offAll(OnboradingScreen());
      } else {
        Get.offAll(LoginScreen());
      }
    }
  }

  //Login

  Future<UserCredential> loginWithemailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'Somthing went wronge. whene Login';
    } catch (e) {
      throw handleExceptions(e);
    }
  }

  //Reiguster

  // ✨ الدالة التي طلبتها
  Future<UserCredential> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'Somthing went wronge. whene SignUp';
    } catch (e) {
      throw handleExceptions(e);
    }
  }

  //Mail Verification

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'Somthing went wronge. whene Verifiy Email';
    } catch (e) {
      // استدعاء الدالة لمعالجة الاستثناءات
      await handleExceptions(e);
    }
  }

  //Google Sign In

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      //Obiti the auth auth Deatiles from  the request
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;
      //Create a new credentials
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return await _auth.signInWithCredential(credential);


    } on FirebaseAuthException catch (e) {
      throw SthandelAuthExpetions(e.code).message;
    }on FirebaseException catch (e) {
      throw SthandelAuthExpetions(e.code).message;
    } on SthandelFormatExceptions catch(_)
    {
      throw SthandelFormatExceptions();
    }on SthandelPlatformExceptions catch(e)
    {
      throw SthandelPlatformExceptions(e.code).message;
    }catch(e)
    {
      if(kDebugMode)
      {
        return null;
      }
    }

  }

  //Logout

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
       Get.offAll(() => LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw SthandelAuthExpetions(e.code).message;
    }on FirebaseException catch (e) {
      throw SthandelAuthExpetions(e.code).message;
    } on SthandelFormatExceptions catch(_)
    {
      throw SthandelFormatExceptions();
    }on SthandelPlatformExceptions catch(e)
    {
      throw SthandelPlatformExceptions(e.code).message;
    }catch(e)
    {
       if (kDebugMode) {
    print('Error: $e');
  }
  return null;
    }
  }
}
