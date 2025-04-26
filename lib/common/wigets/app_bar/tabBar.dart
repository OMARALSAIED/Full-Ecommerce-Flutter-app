import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/device/device_utility.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class OTabbar extends StatelessWidget implements PreferredSizeWidget {
  const OTabbar({super.key, required this.tabs});
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark =THelperfunction.isDarkMode(context);
    return Material(
      color: dark ? AppColor.kblack : AppColor.kwhite,
      child: TabBar(tabs: tabs,
      
      isScrollable: true,
      indicatorColor: AppColor.kPrimery,
      labelColor: AppColor.kDarkgrey,
      unselectedLabelColor: AppColor.kDarkgrey,
      ),
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUitles.getAppBarHeight());
}