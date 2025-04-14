
import 'package:ecommerce/common/wigets/app_bar/appbar.dart';
import 'package:ecommerce/common/wigets/cart_menu_container/cart_menu_container.dart';
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/text_strings.dart';


import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class HomeAppbar extends StatelessWidget {
  const HomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppbar(
      title: Padding(
        padding: const EdgeInsets.only(right: 150),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            Text(
              TText.homeAppbartitle,
              style: Theme.of(
                context,
              ).textTheme.labelMedium!.apply(color: AppColor.grey),
            ),
            Text(
              TText.homeAppbarsubtitle,
              style: Theme.of(context).textTheme.headlineSmall!
                  .apply(color: AppColor.grey),
            ),
          ],
        ),
      ),
    
      actions: [
        TcartContainerIcon(iconcolor: AppColor.kwhite,onPressed: (){},),
      ],
    );
  }
}

