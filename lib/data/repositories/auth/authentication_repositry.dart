
import 'package:ecommerce/features/authentication/screens/login/login.dart';
import 'package:ecommerce/features/authentication/screens/onborading/onborading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepositry extends GetxController {
  static AuthenticationRepositry get instance=>Get.find();
  
  final  devicestorge =GetStorage();
  final _auth=FirebaseAuth.instance;

  @override
  void onReady()
  {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect()async
  {
    if(kDebugMode)
    {
      print("================Get================");
      print(devicestorge.read('isFristTime'));
    }
    devicestorge.writeIfNull('isFristTime', true);
    devicestorge.read('isFristTime') !=true  ? null ?? Get.offAll(LoginScreen()) : Get.offAll(OnboradingScreen());
  }

  //Reiguster

  // ✨ الدالة التي طلبتها
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'حدث خطأ أثناء التسجيل.';
    } catch (e) {
      throw 'حدث خطأ غير متوقع. الرجاء المحاولة لاحقاً.';
    }
  }
}
