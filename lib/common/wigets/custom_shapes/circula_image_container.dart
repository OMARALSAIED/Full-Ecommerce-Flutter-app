import 'package:flutter/material.dart';

class TCircleImageContainer extends StatelessWidget {
  final double? radius;
  final double? width;
  final double? height;
  final ImageProvider image;
  final BoxFit fit;
  final VoidCallback? onTap;

  const TCircleImageContainer({
    super.key,
    required this.image,
    this.radius,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double size = radius != null ? radius! * 2 : width ?? 80;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? size,
        height: height ?? size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: image,
            fit: fit,
          ),
        ),
      ),
    );
  }
}
