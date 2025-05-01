import 'package:ecommerce/features/authentication/controllers/onborading_cotroller.dart';
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/device/device_utility.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingdotNavigation extends StatelessWidget {
   OnBoardingdotNavigation({
    super.key,
  });

  @override
 
  Widget build(BuildContext context) {
     final  controller =OnboradingCotroller.inctance;
  final dark=THelperfunction.isDarkMode(context);
    return Positioned(
      bottom: TDeviceUitles.getBottomNavigationBarHeight()+25,
      left: TSize.defaultspace,
      
      child: SmoothPageIndicator(
        onDotClicked: controller.dotNavigationClik,
        controller: controller.pageController,count: 3,effect: ExpandingDotsEffect(activeDotColor: dark ? AppColor.kLight : AppColor.kDark,dotHeight: 6),));
  }
}


