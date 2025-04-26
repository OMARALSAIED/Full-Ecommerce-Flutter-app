import 'package:ecommerce/features/authentication/screens/password_configuration/resetPassowrd.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            TextFormField(
              decoration: InputDecoration(
                labelText: TText.email,
                prefixIcon: Icon(Iconsax.direct_right),
              ),
            ),
            const SizedBox(height: TSize.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text(TText.submit),
                onPressed: () {Get.to(Resetpassowrd());},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
