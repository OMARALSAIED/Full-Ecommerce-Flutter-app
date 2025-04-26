
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:flutter/material.dart';

class TOutlineButtonTheme
{
  TOutlineButtonTheme._();
 //Light
  static final lightOutLineButtonTheme=OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColor.kblack,
      side: const BorderSide(color: AppColor.kblue),
      textStyle: TextStyle(fontSize: 16,color: AppColor.kblack,fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))
    )
  );

  //Dark

  static final DarkOutLineButtonTheme=OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColor.kwhite,
      side: const BorderSide(color: AppColor.kblueAccent),
      textStyle: TextStyle(fontSize: 16,color: AppColor.kwhite,fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))
    )
  );
}