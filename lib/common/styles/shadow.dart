import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:flutter/cupertino.dart';

class TShadowStyle
{
  static final verticalProductShadoow=BoxShadow(
    color: AppColor.grey.withOpacity(0.8),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );


  static final HorizntalProductShadoow=BoxShadow(
    color: AppColor.kgrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}