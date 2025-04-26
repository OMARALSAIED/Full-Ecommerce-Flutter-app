
import 'package:ecommerce/util/constants/AppColors.dart';


import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TcartCounterIcon extends StatelessWidget {
  const TcartCounterIcon({
    super.key, this.iconcolor, required this.onPressed,
  });

  final Color? iconcolor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            Iconsax.shopping_bag,
            color: iconcolor,
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: AppColor.kblack,
              borderRadius: BorderRadius.circular(100)
            ),
            child: Center(
              child: Text("2",style: Theme.of(context).textTheme.labelLarge!.apply(color: AppColor.kwhite),),
            ),
          )
        )
      ],
    );
  }
}
