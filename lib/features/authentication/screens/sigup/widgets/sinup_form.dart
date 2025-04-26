import 'package:ecommerce/features/authentication/controllers/sign_up_controller.dart';
import 'package:ecommerce/features/authentication/screens/sigup/widgets/terms_andConitiion_checkBox.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/constants/text_strings.dart';
import 'package:ecommerce/util/valdatores/valdation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

class TsignUpForm extends StatelessWidget {
  const TsignUpForm({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  validator:
                      (value) =>
                          AppValdation.validateEmptyText('First name', value),
                  controller: controller.firstname,
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TText.firstname,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: TSize.spaceBtwInputFiled),
              Expanded(
                child: TextFormField(
                  validator:
                      (value) =>
                          AppValdation.validateEmptyText('Last name', value),
                  controller: controller.lastname,
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TText.lastname,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSize.spaceBtwInputFiled),
          TextFormField(
            validator:
                (value) => AppValdation.validateEmptyText('User name', value),
            controller: controller.username,
            decoration: const InputDecoration(
              labelText: TText.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(height: TSize.spaceBtwInputFiled),
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
            decoration: const InputDecoration(
              labelText: TText.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: TSize.spaceBtwInputFiled),
          TextFormField(
            validator: (val) {
              if (val == null ||
                  val.isEmpty ||
                  !AppValdation.isPhoneNumberValid(val)) {
                return 'Please enter a vaild phone Number';
              }
              return null;
            },
            controller: controller.phoneNumber,
            decoration: const InputDecoration(
              labelText: TText.phoneNumber,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: TSize.spaceBtwInputFiled),
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

          termsAndConitiionCheckbox(dark: dark),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                controller.signup();
              },
              child: const Text(TText.CreateAccount),
            ),
          ),
        ],
      ),
    );
  }
}
