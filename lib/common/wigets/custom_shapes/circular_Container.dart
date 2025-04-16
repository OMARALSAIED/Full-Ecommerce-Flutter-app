import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:flutter/material.dart';

class TCirculaContianer extends StatelessWidget {
  const TCirculaContianer({
    this.margin,
    super.key, this.child, 
    this.width=400,this.height=400,this.reaius=400,this.padding=0,
    this.backgroundColor=AppColor.kwhite
  });
final  double? width;
final  double? height;
final double reaius;
final double padding;
final Widget?  child;
final EdgeInsets? margin;
final Color? backgroundColor;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(reaius),color: backgroundColor,)
    );
  }
}