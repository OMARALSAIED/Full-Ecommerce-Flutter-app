
import 'package:ecommerce/features/authentication/controllers/lgoin/login_controller.dart';
import 'package:ecommerce/features/authentication/screens/password_configuration/forgetPassword.dart';
import 'package:ecommerce/features/authentication/screens/sigup/signup.dart';
import 'package:ecommerce/navigation_menu.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/constants/text_strings.dart';
import 'package:ecommerce/util/valdatores/valdation.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';


class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });
  
 
  @override
  Widget build(BuildContext context) {
      final  controller=Get.put(LoginController());
    return Form(
      key:controller.globalKey ,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: TSize.spaceBtwSections,
        ),
        child: Column(
          children: [
            /// Email
            TextFormField(
              validator: (val) {
               if (val == null ||
                  val.isEmpty ||
                  !AppValdation.isEmailValid(val)) {
                return 'Please enter a vaild email';
              }
              return null;
              },
              controller: controller.email,
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.direct_right),
                labelText: TText.email,
              ),
            ),
            const SizedBox(height: TSize.spaceBtwInputFiled),
              
            /// Password
            Obx(
             () => TextFormField(
              
                   validator: (val) {
                if (val == null ||
                    val.isEmpty ||
                    !AppValdation.isPasswordValid(val)) {
                  return 'Please enter a vaild password';
                }
                return null;
              
                  
                },
                obscureText: controller.hidPassword.value,
                controller: controller.password,
                decoration: InputDecoration(
                  labelText: TText.password,
              
                  suffixIcon: IconButton(
                    onPressed:
                        () =>
                            controller.hidPassword.value =
                                !controller.hidPassword.value,
                    icon: Icon(
                      controller.hidPassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye,
                    ),
                  ),
                  prefixIcon: Icon(Iconsax.password_check),
                ),
              ),
            ),
            const SizedBox(height: TSize.spaceBtwInputFiled),
              
            /// Remember Me & Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(
                      ()=> Checkbox(
                          value: controller.remeberMe.value,
                          onChanged: (value) {
                           controller.remeberMe.value=!controller.remeberMe.value;
                          }),
                    ),
                    const Text(TText.rememberMe),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Get.to(Forgetpassword());
                  },
                  child: Text(TText.forgotPassword),
                ),
              ],
            ),
            const SizedBox(height: TSize.spaceBtweenItems),
              
            /// Login Button
            SizedBox(
              width: double.infinity,
              height: TSize.ButtonHight,
              child: ElevatedButton(
                onPressed: () {
                  // Handle login
                  controller.emailAndPasswordSignin();
                },
                child: const Text(TText.loginNow),
              ),
            ),
            const SizedBox(height: TSize.spaceBtweenItems),
              
            /// Create Account Button
            SizedBox(
              width: double.infinity,
              height: TSize.ButtonHight,
              child: OutlinedButton(
                onPressed: () {
                 Get.to(SignupScreen());
                },
                child: const Text(TText.CreateAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}