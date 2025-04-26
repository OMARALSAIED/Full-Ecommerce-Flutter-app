import 'package:ecommerce/common/wigets/text/barnd_title_text.dart';
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/enums.dart';
import 'package:flutter/material.dart';

class BrandTitleWithVerifiedIcon extends StatelessWidget {
  const BrandTitleWithVerifiedIcon({
    super.key,
    this.maxline = 1,
    this.textcolor,
    this.iconcolor = AppColor.kPrimery,
    this.brandTextsize,
    required this.title,
    this.textAlign = TextAlign.center,
  });

  final Color? textcolor, iconcolor;
  final int maxline;
  final String title;
  final TextAlign textAlign;
  final TextSize? brandTextsize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: BarndTitleText(
          
            title: title,
            color: textcolor,
            maxline: maxline,
            textAlign: textAlign,
            brandTextsize: brandTextsize,
          ),
        ),
      ],
    );
  }
}
