

import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/size.dart';

import 'package:flutter/material.dart';


class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.applyImageReduise = true,
    this.showborder=false,
    this.backgroundColor,
    this.fit,
    this.OverlayColor,
    this.isNetworkimage = false,
    this.padding,
    this.onPressed,
    this.borderColor=AppColor.kBorderPrimary,
    this.borderRadius = TSize.md,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageReduise;
  final bool showborder;
  final Color? backgroundColor;
  final BoxFit? fit;
  final bool isNetworkimage;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final double borderRadius;
  final Color borderColor;
  final Color? OverlayColor ;

  @override
  Widget build(BuildContext context) {
    final ImageProvider imageProvider = isNetworkimage
        ? NetworkImage(imageUrl)
        : AssetImage(imageUrl);

        

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 200,
        padding: padding,
        decoration: BoxDecoration(
          border: showborder ? Border.all(color: borderColor): null,
          color: backgroundColor,
          borderRadius: applyImageReduise
              ? BorderRadius.circular(borderRadius)
              : null,
        ),
        child: ClipRRect(
          borderRadius: applyImageReduise
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: Image(
            image:isNetworkimage ?NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider,
            fit: fit ?? BoxFit.cover,
            color: OverlayColor,
          ),
        ),
      ),
    );
  }
}
