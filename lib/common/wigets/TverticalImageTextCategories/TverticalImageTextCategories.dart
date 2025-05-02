
import 'package:ecommerce/common/wigets/custom_shapes/circula_image_container.dart';
import 'package:ecommerce/util/constants/AppColors.dart';



import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';


import 'package:flutter/material.dart';

class TverticalImageTextCategories extends StatelessWidget {
  const TverticalImageTextCategories({
    super.key, required this.image, required this.title, required this.textcolor, this.backgroundColor, this.onTap,this.isNetworkImage=true,
  });

  final String image,title;
  
  final Color textcolor;
  final bool isNetworkImage;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSize.spaceBtweenItems),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TCircleImageContainer(
              fit: BoxFit.fitWidth,
              padding: TSize.sm *1.4,
              isNetworkImage:isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: THelperfunction.isDarkMode(context) ? AppColor.kwhite : AppColor.kblack,
              image: image),
          
            SizedBox(
              width: 45,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textcolor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
