
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:flutter/material.dart';

class TBottomSheetTheme
{
  static BottomSheetThemeData lightBottomSheetTheme=BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: AppColor.kwhite,
    modalBackgroundColor: AppColor.kwhite,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))

  );

   static BottomSheetThemeData DarktBottomSheetTheme=BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: AppColor.kblack,
    modalBackgroundColor: AppColor.kblack,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))

   );

}