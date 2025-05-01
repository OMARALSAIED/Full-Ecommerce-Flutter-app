

import 'package:ecommerce/common/wigets/custom_shapes/rounded_conatiner.dart';

import 'package:ecommerce/common/wigets/images/TRoundedImage.dart';

import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/images_strings.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';



class TBrandCard extends StatelessWidget {
  TBrandCard({
    this.showborder=false,
    super.key,
    this.onTap
    
  });

  final bool showborder;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSize.sm),
        showborder: showborder,
        backgroundColor: AppColor.transparent,
        child: Row(
          children: [
            Flexible(
              child: TRoundedImage(
                showborder: false,
                height: 56,
                width: 56,
                isNetworkimage: false,
                imageUrl: TImage.nikelogo1,
                backgroundColor: AppColor.transparent,
                OverlayColor:
                    THelperfunction.isDarkMode(context)
                        ? AppColor.kwhite
                        : AppColor.kblack,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Nike',
                        style: TextStyle(
                          fontSize: TSize.md,
                        ),
                      ),
                      SizedBox(width: TSize.sm),
                      Icon(
                        Iconsax.verify5,
                        color: AppColor.kPrimery,
                        size: TSize.md,
                      ),
                    ],
                  ),
                  Text(
                    '256 productes',
                    overflow: TextOverflow.ellipsis,
                    style:
                        Theme.of(
                          context,
                        ).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
