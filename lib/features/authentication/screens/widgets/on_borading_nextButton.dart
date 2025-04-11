import 'package:ecommerce/features/authentication/controllers/onborading_cotroller.dart';
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/device/device_utility.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingNextButton extends StatelessWidget {
  OnBoardingNextButton({
    super.key,
  });

 

  @override
  Widget build(BuildContext context) {
     final dark=THelperfunction.isDarkMode(context);
    return Positioned(
      right: TSize.defaultspace,
      bottom: TDeviceUitles.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(shape:const CircleBorder(),backgroundColor: dark ?AppColor.kPrimery :AppColor.kDark),
        onPressed: ()=> OnboradingCotroller.inctance.NextPage(), child: Icon(Iconsax.arrow_right_3,color: dark ? AppColor.kLight : AppColor.kLight,)));
  }
}
