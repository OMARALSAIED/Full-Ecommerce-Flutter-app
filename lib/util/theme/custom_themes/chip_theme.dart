
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:flutter/material.dart';

class TchipTheme
{
  TchipTheme._();
  //LightChipTheme
  static ChipThemeData lightChipTheme=ChipThemeData(
    disabledColor: AppColor.kgrey.withOpacity(0.4),
    labelStyle: const TextStyle(color: AppColor.kblack),
    selectedColor: AppColor.kblue,
    padding: const EdgeInsetsDirectional.symmetric(horizontal: 12,vertical: 12),
    checkmarkColor: AppColor.kwhite,
  );

  //DarkChipTheme
    static ChipThemeData DarkChipTheme=ChipThemeData(
    disabledColor: AppColor.kgrey.withOpacity(0.4),
    labelStyle: const TextStyle(color: AppColor.kwhite),
    selectedColor: AppColor.kblue,
    padding: const EdgeInsetsDirectional.symmetric(horizontal: 12,vertical: 12),
    checkmarkColor: AppColor.kwhite,
  );


}