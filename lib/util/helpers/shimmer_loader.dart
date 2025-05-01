import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class OShimmereffect
 extends StatelessWidget {
   OShimmereffect
  ({super.key,
  this.raduis=15,
   required this.width,
   required  this.height,
   this.color
  });
  final double width ,height,raduis;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark=THelperfunction.isDarkMode(context);
    return Shimmer.fromColors( baseColor: dark ? Colors.grey[850] ! : Colors.grey[300]!, highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? (dark ? AppColor.kDarkergrey : AppColor.kwhite),
        borderRadius: BorderRadius.circular(raduis)
      ),
    ),
    
    );
}}