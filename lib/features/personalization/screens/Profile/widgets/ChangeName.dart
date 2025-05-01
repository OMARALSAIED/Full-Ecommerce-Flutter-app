import 'package:ecommerce/common/wigets/app_bar/appbar.dart';
import 'package:ecommerce/features/personalization/controllers/update_name_controller.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/constants/text_strings.dart';
import 'package:ecommerce/util/valdatores/valdation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:iconsax/iconsax.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(UpdateNameController());
    return Scaffold(
      appBar: TAppbar(
        title: Text(
          'Change Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(TSize.defaultspace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Use real name for easy verification. This name will appear on several pages',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: TSize.spaceBtwSections),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstname,
                    validator: (value) {
                      AppValdation.validateEmptyText('Frist name', value);
                    },
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: TText.firstname,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                  const SizedBox(height: TSize.spaceBtwInputFiled),
                   TextFormField(
                     controller: controller.lastname,
                    validator: (value) {
                      AppValdation.validateEmptyText('Last name', value);
                    },
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: 'Last name',
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                ],
              ),
            ),
              const SizedBox(height: TSize.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  controller.updateUserName();
                }, child:const Text('Save')),
              )
          ],
        ),
      ),
    );
  }
}
