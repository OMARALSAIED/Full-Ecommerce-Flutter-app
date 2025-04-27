
import 'package:ecommerce/data/repositories/auth/authentication_repositry.dart';
import 'package:ecommerce/features/authentication/controllers/signup/verfiy_email_controller.dart';
import 'package:ecommerce/features/authentication/screens/login/login.dart';
import 'package:ecommerce/util/constants/images_strings.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/constants/text_strings.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class VeryifyEmail extends StatelessWidget {
  const VeryifyEmail({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerfiyEmailController());
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepositry.instance.logout(),
            icon: Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Image(
              width: THelperfunction.screenWidth(context) * 0.6,

              image: AssetImage(TImage.VeryifyEmail),
            ),
          ),
          const SizedBox(height: TSize.spaceBtwSections),
          Text(
            TText.Verifyemail,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: TSize.spaceBtweenItems),
          Text(
            email ?? '',
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: TSize.spaceBtwSections),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ElevatedButton(
                onPressed: () {
                controller.checkEmailVerificationStatus();
                },
                child: const Text(TText.continueButton),
              ),
            ),
          ),
          const SizedBox(height: TSize.spaceBtwSections),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () =>controller.sendEmailVerification(),
              child: const Text(TText.Resendemail),
            ),
          ),
          const SizedBox(height: TSize.spaceBtwSections),
        ],
      ),
    );
  }
}
