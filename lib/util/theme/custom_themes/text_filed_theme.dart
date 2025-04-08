
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:flutter/material.dart';

class TTextFiledTheme {
  TTextFiledTheme._();


 //LightTheme
  static InputDecorationTheme lightInputDecortaionTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AppColor.kgrey,
    suffixIconColor: AppColor.kgrey,

    labelStyle: const TextStyle().copyWith(
      fontSize: 14,
      color: AppColor.kblack,
    ),
    hintStyle: const TextStyle().copyWith(fontSize: 14, color: AppColor.kblack),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(
      color: AppColor.kblack.withOpacity(0.8),
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: AppColor.kgrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: AppColor.kgrey),
    ),

    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: AppColor.kblack),
    ),

    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: AppColor.kred),
    ),

    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 2, color: AppColor.korange),
    ),
  );


//DarkTheme
  static InputDecorationTheme darkInputDecortaionTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AppColor.kgrey,
    suffixIconColor: AppColor.kgrey,

    labelStyle: const TextStyle().copyWith(
      fontSize: 14,
      color: AppColor.kwhite,
    ),
    hintStyle: const TextStyle().copyWith(fontSize: 14, color: AppColor.kwhite),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(
      color: AppColor.kwhite.withOpacity(0.8),
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: AppColor.kgrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: AppColor.kgrey),
    ),

    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: AppColor.kblack),
    ),

    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: AppColor.kred),
    ),

    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 2, color: AppColor.korange),
    ),
  );
}
