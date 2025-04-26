import 'package:ecommerce/data/repositories/user/user_repository.dart';
import 'package:ecommerce/features/authentication/screens/sigup/veryifyemail.dart';
import 'package:ecommerce/util/popups/loader.dart';
import 'package:ecommerce/common/wigets/internet/network_manger.dart';
import 'package:ecommerce/data/repositories/auth/authentication_repositry.dart';

import 'package:ecommerce/features/authentication/models/sign_up_model.dart';
import 'package:ecommerce/util/constants/images_strings.dart';
import 'package:ecommerce/util/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final hidPassword = true.obs;
  final privacyPolicyAccepted = true.obs;
  final email = TextEditingController();
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final password = TextEditingController();
  final username = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void signup() async {
  try {
    // Start Loading
    FullScreenLoader.openLoadingDiloG('نقوم بمعالجة بياناتك...', TImage.loading);

    // Check internet
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
    //  FullScreenLoader.stopLoading();
      return;
    }



    // Form Validation
    if (!signupFormKey.currentState!.validate()) {
      // FullScreenLoader.stopLoading();
      return;
    }


    // Check Privacy Policy
    if (!privacyPolicyAccepted.value) {
    
      Loader.warningSnackbar(
        'مطلوب الموافقة',
        'يجب أن توافق على سياسة الخصوصية وشروط الاستخدام لإنشاء الحساب.',
      );
      return;
    }




     // Register user
      final userCredential = await AuthenticationRepositry.instance.registerWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );
    
      

      // Save user record (بدون كلمة المرور نهائياً)
      final newUser = UserModel(
        id: userCredential.user!.uid,
        
        firstName: firstname.text.trim(),
        lastName: lastname.text.trim(),
        userName: username.text.trim(),
        email: email.text.trim(),
        password: password.text.trim(), // لا نحفظ الباسورد
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );
    

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      Loader.successSnackbar('تم إنشاء الحساب', 'تم إنشاء حسابك بنجاح!');

      // يمكنك بعدها إعادة التوجيه إلى صفحة تسجيل الدخول
      Get.to(()=>VeryifyEmail());

    } catch (e) {
      Loader.errorSnackbar('حدث خطأ!', e.toString());
    } 
  }
}