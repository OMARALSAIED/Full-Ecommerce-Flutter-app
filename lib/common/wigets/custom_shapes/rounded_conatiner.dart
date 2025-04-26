import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:flutter/material.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer(  {
    super.key,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.child,
    this.showborder = false,
    this.borderRadius = TSize.cardRadiusSm,
    this.backgroundColor = AppColor.kwhite,
    this.border,
    this.shadow,
    this.borderColo=AppColor.kBorderPrimary
  });

  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  final double borderRadius;
  final Color backgroundColor;
  final BoxBorder? border;
  final bool showborder ;
  final Color borderColo;
  final List<BoxShadow>? shadow;

  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: showborder ? Border.all(color: borderColo) : null,
        boxShadow:shadow ,
      ),
      child: child,
    );
  }
}
