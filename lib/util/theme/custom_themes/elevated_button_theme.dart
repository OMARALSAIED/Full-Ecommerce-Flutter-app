
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:flutter/material.dart';

class TElevatedButtonTheme

{
  TElevatedButtonTheme._();
//Light Theme
  static final lightelvatedButtonTheme=ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColor.kwhite,
      backgroundColor: AppColor.kblue,
      disabledForegroundColor: AppColor.kgrey,
      disabledBackgroundColor: AppColor.kgrey,
      side: const BorderSide(color: AppColor.kblue),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(fontSize: 16,color: AppColor.kwhite,fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(12))
    )
  );


  //Dark Theme
   static final darkelvatedButtonTheme=ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColor.kwhite,
      backgroundColor: AppColor.kblue,
      disabledForegroundColor: AppColor.kgrey,
      disabledBackgroundColor: AppColor.kgrey,
      side: const BorderSide(color: AppColor.kblue),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(fontSize: 16,color: AppColor.kwhite,fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(12))
    )
  );


}