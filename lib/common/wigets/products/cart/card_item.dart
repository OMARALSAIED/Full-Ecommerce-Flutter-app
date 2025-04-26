import 'package:ecommerce/common/wigets/images/TRoundedImage.dart';
import 'package:ecommerce/common/wigets/text/brandTitleWithVerifiedIcon.dart';
import 'package:ecommerce/common/wigets/text/product_title_text.dart';
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/images_strings.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class OCardItem extends StatelessWidget {
  const OCardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TRoundedImage(
          imageUrl: TImage.sinekersrem,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSize.sm),
          backgroundColor:
              THelperfunction.isDarkMode(context)
                  ? AppColor.kblack
                  : AppColor.kwhite,
        ),
        const SizedBox(width: TSize.spaceBtweenItems),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BrandTitleWithVerifiedIcon(title: 'Nike'),
              Flexible(
                child: tProductTitleText(
                  title: 'Green sports shoes ',
                  maxLines: 1,
                ),
              ),
              Text.rich(TextSpan(children: [
                TextSpan(text: 'Color ',style: Theme.of(context).textTheme.bodySmall),
              TextSpan(text: 'Green  ',style: Theme.of(context).textTheme.bodySmall),
                TextSpan(text: 'Size ',style: Theme.of(context).textTheme.bodySmall),
              TextSpan(text: 'UK 44  ',style: Theme.of(context).textTheme.bodySmall),
              ]))
            ],
          ),
        ),
      ],
    );
  }
}
