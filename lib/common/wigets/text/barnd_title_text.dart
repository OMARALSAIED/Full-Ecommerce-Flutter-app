import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/enums.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BarndTitleText extends StatelessWidget {
  BarndTitleText({
    this.maxline = 1,
    this.color,
    this.brandTextsize,
    super.key,
    required this.title,
    this.textAlign = TextAlign.center,
  });
  final Color? color;
  final int maxline;
  final String title;
  final TextAlign textAlign;
  final TextSize? brandTextsize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          maxLines: maxline,
          style:
              brandTextsize == TSize.sm
                  ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
                  : brandTextsize == TSize.md
                  ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
                  : brandTextsize == TSize.lg
                  ? Theme.of(context).textTheme.titleLarge!.apply(color: color)
                  : Theme.of(context).textTheme.bodyMedium!.apply(color: color),
          textAlign: textAlign,
        ),
        
        Icon(Iconsax.verify5, color: AppColor.kPrimery, size: TSize.iconXs),
      
      ],
    );
  }
}
