import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/size.dart';

import 'package:flutter/material.dart';

class TAppbarTheme {

TAppbarTheme._();

static const lightAppBarTheme=AppBarTheme(
  elevation: 0,
  centerTitle: false,
  scrolledUnderElevation: 0,
  backgroundColor: AppColor.ktransparent,
  surfaceTintColor: Colors.transparent,
  iconTheme: IconThemeData(color: AppColor.kblack,size:TSize.iconmd),
  actionsIconTheme: IconThemeData(color: AppColor.kblack,size: 24),
  titleTextStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: AppColor.kblack),
);


//AppBar Darktheme
static const darkAppBarTheme=AppBarTheme(
  elevation: 0,
  centerTitle: false,
  scrolledUnderElevation: 0,
  backgroundColor: AppColor.ktransparent,
  surfaceTintColor: Colors.transparent,
  iconTheme: IconThemeData(color: AppColor.kblack,size:   TSize.iconmd),
  actionsIconTheme: IconThemeData(color: AppColor.kwhite,size:  TSize.iconmd),
  titleTextStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: AppColor.kwhite),
);
}