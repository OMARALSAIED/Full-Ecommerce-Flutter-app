import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/common/wigets/Shimmer/shimmer_loader.dart';
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
    this.showborder = false,
    this.backgroundColor,
    this.fit,
    this.OverlayColor,
    this.isNetworkimage = false,
    this.padding,
    this.onPressed,
    this.borderColor = AppColor.kBorderPrimary,
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
  final Color? OverlayColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ClipRRect(
            borderRadius: applyImageReduise ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
            child: Container(
              width: width ?? constraints.maxWidth,
              height: height ?? constraints.maxHeight,
              padding: padding,
              decoration: BoxDecoration(
                color: backgroundColor,
                border: showborder ? Border.all(color: borderColor) : null,
              ),
              child: isNetworkimage
                  ? CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: fit ?? BoxFit.cover,
                      progressIndicatorBuilder: (context, url, progress) => OShimmereffect(
                        width: width ?? constraints.maxWidth,
                        height: height ?? constraints.maxHeight,
                      ),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    )
                  : Image(
                      image: AssetImage(imageUrl),
                      fit: fit ?? BoxFit.cover,
                    ),
            ),
          );
        },
      ),
    );
  }
}
