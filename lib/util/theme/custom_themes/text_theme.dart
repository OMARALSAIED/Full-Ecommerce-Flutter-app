
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:flutter/material.dart';

class TTextTheme {
  TTextTheme._();

  //Cutomized light Text Theme

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),

  

    titleLarge: const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w600,color: AppColor.kblack),
    titleMedium: const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w500,color: AppColor.kblack),
    titleSmall: const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w400,color: AppColor.kblack),


    bodyLarge: const TextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w600,color: AppColor.kblack),
    bodyMedium: const TextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w500,color: AppColor.kblack),
    bodySmall: const TextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w400,color: AppColor.kblack.withOpacity(0.5)),


    labelLarge: const TextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.normal,color: AppColor.kblack),
    labelMedium: const TextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.normal,color: AppColor.kblack.withOpacity(0.5)),
  );


  //Cutomized Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColor.kwhite
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColor.kwhite
    ),
    headlineSmall:  const TextStyle().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColor.kwhite
    ),


     titleLarge: const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w600,color: AppColor.kwhite),
    titleMedium: const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w500,color: AppColor.kwhite),
    titleSmall: const TextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w400,color: AppColor.kwhite),


    bodyLarge: const TextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w600,color: AppColor.kwhite),
    bodyMedium: const TextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w500,color: AppColor.kwhite),
    bodySmall: const TextStyle().copyWith(fontSize: 14,fontWeight: FontWeight.w400,color: AppColor.kwhite.withOpacity(0.5)),


    labelLarge: const TextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.normal,color: AppColor.kwhite),
    labelMedium: const TextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.normal,color: AppColor.kwhite.withOpacity(0.5)),
  );
}
