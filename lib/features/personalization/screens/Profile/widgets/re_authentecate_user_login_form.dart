import 'package:ecommerce/common/wigets/app_bar/appbar.dart';
import 'package:ecommerce/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/constants/text_strings.dart';
import 'package:ecommerce/util/valdatores/valdation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: TAppbar(title: Text('Re-Authenticate User')),
      body: Padding(
        padding: EdgeInsets.all(TSize.defaultspace),
        child: Form(
          key: controller.ReAuthLoginFormkey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.verifiyEmail,
                validator: (val) {
                  if (val == null ||
                      val.isEmpty ||
                      !AppValdation.isEmailValid(val)) {
                    return 'Please enter a vaild email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: TText.email,
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
                  controller: controller.verifiyPassword,
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
              const SizedBox(height: TSize.spaceBtwInputFiled,),
             SizedBox(width: double.infinity,
              child: ElevatedButton(onPressed: ()=>controller.reAuthenticateEmailAndPassword(), child:const Text('Verifiy') ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
