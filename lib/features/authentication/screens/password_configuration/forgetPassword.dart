import 'package:ecommerce/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:ecommerce/features/authentication/screens/password_configuration/resetPassowrd.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/constants/text_strings.dart';
import 'package:ecommerce/util/valdatores/valdation.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(ForgetPasswordController())
;    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(TSize.defaultspace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              TText.forgotPassword,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: TSize.spaceBtweenItems),
            Text(
              TText.forgotPasswordsubtitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: TSize.spaceBtwSections * 2),
            Form(
              key: controller.forgetpasswordformkey,
              child: TextFormField(
                controller: controller.email,
                validator: (val){
                
              if (val == null ||
                  val.isEmpty ||
                  !AppValdation.isEmailValid(val)) {
                return 'Please enter a vaild email';
              }
              return null;
                },
                decoration: InputDecoration(
                  labelText: TText.email,
                  prefixIcon: Icon(Iconsax.direct_right),
                ),
              ),
            ),
            const SizedBox(height: TSize.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text(TText.submit),
                onPressed: () {controller.sedPasswordResetEmail();},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
