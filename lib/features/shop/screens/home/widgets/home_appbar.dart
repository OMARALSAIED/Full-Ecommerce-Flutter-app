import 'package:ecommerce/common/wigets/app_bar/appbar.dart';
import 'package:ecommerce/common/wigets/products/cart/cart_menu_icon.dart';
import 'package:ecommerce/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce/features/shop/screens/cart/CartScreen.dart';
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/text_strings.dart';
import 'package:ecommerce/common/wigets/Shimmer/shimmer_loader.dart';
import 'package:ecommerce/util/theme/widgets/theme_buttonsun.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';


class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppbar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              TText.homeAppbartitle,
              style: Theme.of(
                context,
              ).textTheme.labelMedium!.apply(color: AppColor.kwhite),
            ),
          ),
          Obx(() {
            if (controller.profileLoading.value) {
             return  OShimmereffect(width: 80, height: 15);
            } else {
              return Text(
                controller.user.value.fullName,
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall!.apply(color: AppColor.kwhite),
              );
            }
          }),
        ],
      ),

      actions: [
        ThemeToggleButton(),
        TcartCounterIcon(
          iconcolor: AppColor.kwhite,
          onPressed: () {
            Get.to(Cartscreen());
          },
        ),
      ],
    );
  }
}
