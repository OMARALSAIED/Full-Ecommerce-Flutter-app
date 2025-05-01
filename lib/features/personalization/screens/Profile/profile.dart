import 'package:ecommerce/common/wigets/app_bar/appbar.dart';
import 'package:ecommerce/common/wigets/custom_shapes/circula_image_container.dart';
import 'package:ecommerce/common/wigets/text/sction_heading.dart';
import 'package:ecommerce/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce/features/personalization/screens/Profile/widgets/ChangeName.dart';
import 'package:ecommerce/features/personalization/screens/Profile/widgets/profile_menu.dart';
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/images_strings.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:iconsax/iconsax.dart';

class Porfile extends StatelessWidget {
  const Porfile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: TAppbar(
        showBackArrow: true,
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSize.defaultspace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkimage = controller.user.value.profilePicture;
                      final _ =
                          networkimage.isNotEmpty ? networkimage : TImage.usericon;
                      return TCircleImageContainer(
                        
                        image: TImage.nikee,//image replce
                        width: 80,
                        height: 80,
                        
                      );
                    }),
                    TextButton(
                      onPressed: () {},
                      child: Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: TSize.spaceBtweenItems / 2),
              const Divider(),
              const SizedBox(height: TSize.spaceBtweenItems),
              TSectionHeading(title: 'Profile Infomation'),
              const SizedBox(height: TSize.spaceBtweenItems),
              profile_menu(
                title1: "Name",
                title2: controller.user.value.fullName,
                icon: Iconsax.arrow_right_34,
                onPressed: () {
                  Get.to(ChangeName());
                },
              ),
              profile_menu(
                title1: "Username",
                title2: controller.user.value.userName,
                icon: Iconsax.arrow_right_34,
                onPressed: () {},
              ),
              const Divider(),
              const SizedBox(height: TSize.spaceBtweenItems),
              TSectionHeading(title: 'Personal Information'),
              const SizedBox(height: TSize.spaceBtweenItems),
              profile_menu(
                title1: "User ID",
                title2: controller.user.value.id,
                icon: Iconsax.copy,
                onPressed: () {},
              ),
              profile_menu(
                title1: "E-mail",
                title2: controller.user.value.email,
                icon: Iconsax.arrow_right_34,
                onPressed: () {},
              ),
              profile_menu(
                title1: "Phone Number",
                title2: controller.user.value.phoneNumber,
                icon: Iconsax.arrow_right_34,
                onPressed: () {},
              ),
              profile_menu(
                title1: "Gender",
                title2: "Male",
                icon: Iconsax.arrow_right_34,
                onPressed: () {},
              ),
              profile_menu(
                title1: "Date of Brith",
                title2: "2001/3/5",
                icon: Iconsax.arrow_right_34,
                onPressed: () {},
              ),
              const Divider(),
              const SizedBox(height: TSize.md),
              Center(
                child: TextButton(
                  onPressed: () {
                    controller.deleteAccountWaringPoup();
                  },
                  child: Text(
                    'Close Account',
                    style: TextStyle(color: AppColor.kred),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
