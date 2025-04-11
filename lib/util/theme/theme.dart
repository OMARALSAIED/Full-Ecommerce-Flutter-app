import 'package:ecommerce/util/constants/AppColors.dart';

import 'package:ecommerce/util/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:ecommerce/util/theme/custom_themes/checkbox_theme.dart';
import 'package:ecommerce/util/theme/custom_themes/chip_theme.dart';
import 'package:ecommerce/util/theme/custom_themes/elevated_button_theme.dart';
import 'package:ecommerce/util/theme/custom_themes/outline_button_theme.dart';
import 'package:ecommerce/util/theme/custom_themes/text_filed_theme.dart';
import 'package:ecommerce/util/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();
//Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: AppColor.kblue,
    chipTheme: TchipTheme.lightChipTheme,
    checkboxTheme: TCheckBoxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    outlinedButtonTheme: TOutlineButtonTheme.lightOutLineButtonTheme,
    inputDecorationTheme: TTextFiledTheme.lightInputDecortaionTheme,
    scaffoldBackgroundColor: AppColor.kwhite,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightelvatedButtonTheme
  );

  //Dark Theme
  static ThemeData darkTheme = ThemeData(
     useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: AppColor.kblack,
    scaffoldBackgroundColor: AppColor.kblack,
    chipTheme: TchipTheme.lightChipTheme,
    checkboxTheme: TCheckBoxTheme.DarkCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.DarktBottomSheetTheme,
    outlinedButtonTheme: TOutlineButtonTheme.DarkOutLineButtonTheme,
    inputDecorationTheme: TTextFiledTheme.darkInputDecortaionTheme,
    
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkelvatedButtonTheme
    

  );
}
