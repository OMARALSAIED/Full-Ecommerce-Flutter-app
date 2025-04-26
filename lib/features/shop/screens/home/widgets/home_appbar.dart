
import 'package:ecommerce/common/wigets/app_bar/appbar.dart';
import 'package:ecommerce/common/wigets/products/cart/cart_menu_icon.dart';
import 'package:ecommerce/features/shop/screens/cart/CartScreen.dart';
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/text_strings.dart';
import 'package:ecommerce/util/theme/widgets/theme_buttonsun.dart';


import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';


class HomeAppbar extends StatelessWidget {
  const HomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppbar(
    
      title: Padding(
        padding: const EdgeInsets.only(right: 90),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            Text(
              TText.homeAppbartitle,
              style: Theme.of(
                context,
              ).textTheme.labelMedium!.apply(color: AppColor.kwhite),
            ),
            Text(
              TText.homeAppbarsubtitle,
              style: Theme.of(context).textTheme.headlineSmall!
                  .apply(color: AppColor.kwhite),
            ),
          ],
        ),
      ),
    
      actions: [
        ThemeToggleButton(),
        TcartCounterIcon(iconcolor: AppColor.kwhite,onPressed: (){Get.to(Cartscreen());},),
      ],
    );
  }
}

