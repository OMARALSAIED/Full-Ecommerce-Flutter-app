
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/constants/text_strings.dart';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: TSize.spaceBtwSections,
        ),
        child: Column(
          children: [
            /// Email
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.direct_right),
                labelText: TText.email,
              ),
            ),
            const SizedBox(height: TSize.spaceBtwInputFiled),
              
            /// Password
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                suffixIcon: const Icon(Iconsax.eye_slash),
                prefixIcon:const Icon(Iconsax.password_check) ,
                labelText: TText.password,
              ),
            ),
            const SizedBox(height: TSize.spaceBtwInputFiled),
              
            /// Remember Me & Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                        value: true,
                        onChanged: (value) {
                          // Your logic here
                        }),
                    const Text(TText.rememberMe),
                  ],
                ),
                TextButton(
                  onPressed: () {},
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
                  // Handle account creation
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