
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/size.dart';

import 'package:ecommerce/util/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

class TAppbar extends StatelessWidget implements PreferredSizeWidget {
  const TAppbar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPrecceds,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPrecceds;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: TSize.md),
      child: PreferredSize(
        preferredSize: preferredSize,
        child: SafeArea(
          child: SizedBox(
            height: preferredSize.height,
            child: Row(
              children: [
                // Back Arrow or Leading Icon
                if (showBackArrow)
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Iconsax.arrow_left),
                  )
                else if (leadingIcon != null)
                  IconButton(
                    onPressed: leadingOnPrecceds,
                    icon: Icon(leadingIcon),
                  ),
                 const SizedBox(width: 20,),
                // Title - takes up remaining space
                if (title != null)
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: title!,
                    ),
                  ),

                // Custom Spacing if needed
                const SizedBox(width: 16),

                // Actions on the right
                if (actions != null) ...actions!,
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUitles.getAppBarHeight());
}
