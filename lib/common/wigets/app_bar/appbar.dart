import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

class TAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  const TAppbar({super.key, this.title,  this.showBackArrow=true, this.leadingIcon, this.actions,  this.leadingOnPrecceds});
  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>?  actions;
  final VoidCallback? leadingOnPrecceds;


  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal:TSize.xl ),
    child: AppBar(
      backgroundColor: AppColor.kPrimery,
      automaticallyImplyLeading: false,
    leading:showBackArrow ? IconButton(onPressed: ()=>Get.back(), icon:const Icon(Iconsax.arrow_left) ) : leadingIcon!=null ? IconButton(onPressed: leadingOnPrecceds, icon: Icon(leadingIcon) ) :null,
    title: title,
    actions: actions,
    ));
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUitles.getAppBarHeight());

}