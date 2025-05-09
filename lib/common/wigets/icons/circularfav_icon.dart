import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class CircularFavIcon extends StatelessWidget {
 CircularFavIcon({
    super.key,
  
     this.width,
     this.height,
     this.size,
     this.backgroundColor,
     this.color, required this.icon, this.onPressed,
  });

  final double? width;
  final double? height;
  final double? size;
  final Color? backgroundColor;
  final Color? color;
  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color:
            backgroundColor!=null 
                ? backgroundColor !: THelperfunction.isDarkMode(context)? Color(0xFF272727).withOpacity(0.3)
                : AppColor.kwhite.withOpacity(0.3)
      ),
      child: IconButton(onPressed: onPressed, icon:  Icon(icon,size: size,color: color,)),
    );
  }
}
