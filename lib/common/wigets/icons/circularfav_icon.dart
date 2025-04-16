import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CircularFavIcon extends StatelessWidget {
  const CircularFavIcon({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: dark ? AppColor.kblack.withOpacity(0.9) : AppColor.kwhite.withOpacity(0.9),
      ),
      child: IconButton(onPressed: (){}, icon: const Icon(Iconsax.heart5)),
    );
  }
}
