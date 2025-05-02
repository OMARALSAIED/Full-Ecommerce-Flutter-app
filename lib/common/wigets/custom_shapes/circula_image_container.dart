import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:ecommerce/common/wigets/Shimmer/shimmer_loader.dart';
import 'package:flutter/material.dart';

class TCircleImageContainer extends StatelessWidget {
  final double? radius;
  final double width;
  final double height;
  final double padding;
  final String image;
  final BoxFit fit;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? overlayColor;
  final bool isNetworkImage;



  const TCircleImageContainer({
    super.key,
    required this.image,
    this.padding = TSize.sm,
    this.radius,
    this.width=50,
    this.backgroundColor,
    this.height=50,
    this.fit = BoxFit.cover,
    this.onTap,
    this.isNetworkImage = false,
    this.overlayColor,
  });

  @override
  Widget build(BuildContext context) {
    

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor ??
              (THelperfunction.isDarkMode(context)
                  ? AppColor.kblack
                  : AppColor.kwhite),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ClipOval(
          child: isNetworkImage
              ? CachedNetworkImage(
                  imageUrl: image,
                  fit: fit,
                  color: overlayColor,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      OShimmereffect(width: width, height: height),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error, size: 32),
                )
              : Image.asset(
                  image,
                  fit: fit,
                  color: overlayColor,
                ),
        ),
      ),
    );
  }
}
