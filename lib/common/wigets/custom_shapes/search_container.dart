
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/device/device_utility.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';

import 'package:flutter/material.dart';



class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key, required this.text, required this.icon,  this.showBackground=false,  this.showBorder=false,this.onTap
  });

  final String text;
  final IconData icon;
  final bool showBackground,showBorder;
 final void  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark=THelperfunction.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: TSize.defaultspace,
        ),
        child: Container(
          width: TDeviceUitles.getScreenwidth(),
          padding: EdgeInsets.all(TSize.md),
          decoration: BoxDecoration(
            color:showBackground? dark? AppColor.kblack :AppColor.kwhite:AppColor.ktransparent,
            borderRadius: BorderRadius.circular(TSize.cardRadiusLg),
            border: showBorder ? Border.all(color: AppColor.grey) :null,
          ),
          child: Row(
            children: [
              Icon(icon, color: AppColor.kDarkergrey),
              const SizedBox(width: TSize.spaceBtweenItems),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
