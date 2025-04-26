import 'package:ecommerce/common/wigets/icons/circularfav_icon.dart';
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductQuantityWithAddAndRemove extends StatelessWidget {
  const ProductQuantityWithAddAndRemove({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
     
       CircularFavIcon(icon: Iconsax.minus,
       width: 32,
       height: 32,
       size: TSize.md,
       color: THelperfunction.isDarkMode(context) ? AppColor.kDarkgrey : AppColor.kblack,
       ),
       const SizedBox(width: TSize.spaceBtweenItems,),
       Text('2',style: Theme.of(context).textTheme.labelSmall),
        const SizedBox(width: TSize.spaceBtweenItems,),
        CircularFavIcon(icon: Iconsax.add,
       width: 32,
       height: 32,
       size: TSize.md,
       color:  AppColor.kwhite,
       backgroundColor: AppColor.kPrimery,
       ),
    ],);
  }
}

