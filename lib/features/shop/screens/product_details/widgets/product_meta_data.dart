import 'package:ecommerce/common/wigets/custom_shapes/circula_image_container.dart';
import 'package:ecommerce/common/wigets/custom_shapes/rounded_conatiner.dart';
import 'package:ecommerce/common/wigets/text/brandTitleWithVerifiedIcon.dart';
import 'package:ecommerce/common/wigets/text/product_price_text.dart';
import 'package:ecommerce/common/wigets/text/product_title_text.dart';
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/images_strings.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperfunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TRoundedContainer(
              backgroundColor: AppColor.kSecondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                horizontal: TSize.sm,
                vertical: TSize.xs,
              ),
              child: Text(
                "25%",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: AppColor.kblack),
              ),
            ),
            const SizedBox(width: TSize.spaceBtweenItems),
            Text(
              '\$250',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    decoration: TextDecoration.lineThrough,
                  ),
            ),
            const SizedBox(width: TSize.spaceBtweenItems),
             ProductPriceText(price: '250', isLarg: true),
          ],
        ),
        const SizedBox(height: TSize.spaceBtweenItems / 1.5),
       tProductTitleText(title: 'Green Nike Sports Shirt'),
        const SizedBox(height: TSize.spaceBtweenItems / 1.5),
        Row(
          children: [
           tProductTitleText(title: 'Status'),
            const SizedBox(width: TSize.spaceBtweenItems / 1.5),
            Text(
              'In Stock',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: TSize.spaceBtweenItems / 1.5),
        Row(
          children: [
            TCircleImageContainer(
              
              width: 32,
              height: 32,
              image: dark ?TImage.nikelogo3 : TImage.nikelogo2 ,),
              const SizedBox(width: 10,),
            Expanded(child: BrandTitleWithVerifiedIcon(title: 'Nike')),
            
          ],
        ),
      
      ],
    );
  }
}
