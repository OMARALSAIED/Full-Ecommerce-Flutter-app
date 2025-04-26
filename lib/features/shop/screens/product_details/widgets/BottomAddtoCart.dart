import 'package:ecommerce/common/wigets/icons/circularfav_icon.dart';
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Bottomaddtocart extends StatelessWidget {
  const Bottomaddtocart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperfunction.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: TSize.defaultspace,
        vertical: TSize.defaultspace / 2,
      ),
      decoration: BoxDecoration(
        color: dark ? AppColor.kDarkgrey : AppColor.kwhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(TSize.cardRadiusLg),
          topRight: Radius.circular(TSize.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                CircularFavIcon(
                  icon: Iconsax.minus,
                  backgroundColor: AppColor.kDarkgrey,
                  width: 40,
                  height: 40,
                  color: AppColor.kwhite,
                ),
                const SizedBox(width: TSize.spaceBtweenItems),
                Text('2', style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(width: TSize.spaceBtweenItems),
                CircularFavIcon(
                  icon: Iconsax.add,
                  backgroundColor: AppColor.kblack,
                  width: 40,
                  height: 40,
                  color: AppColor.kwhite,
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(TSize.md),
              backgroundColor: AppColor.kblack,
              side: BorderSide(color: AppColor.kblack),
            ),
            child: Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
