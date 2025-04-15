
import 'package:ecommerce/util/constants/AppColors.dart';


import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';

import 'package:flutter/material.dart';

class TverticalImageTextCategories extends StatelessWidget {
  const TverticalImageTextCategories({
    super.key, required this.image, required this.title, required this.textcolor, this.backgroundColor, this.onTap,
  });

  final String image,title;
  final Color textcolor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSize.spaceBtweenItems),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(TSize.sm),
              decoration: BoxDecoration(
                color: backgroundColor ?? (THelperfunction.isDarkMode(context) ? AppColor.kblack :AppColor.kwhite),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  
                ),
              ), // Optional: show icon
            ),
          
            SizedBox(
              width: 55,
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
