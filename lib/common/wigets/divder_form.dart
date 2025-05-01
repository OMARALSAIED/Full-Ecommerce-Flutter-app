import 'package:ecommerce/util/constants/AppColors.dart';

import 'package:flutter/material.dart';


class TFormDivder extends StatelessWidget {
  const TFormDivder({
    super.key,
    required this.dark,
    required this.dividerText
  });

  final bool dark;
  final String dividerText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: dark ? AppColor.kDarkgrey : AppColor.grey,
            thickness: 0.5,
            indent: 20,
            endIndent: 20,
          ),
        ),
        Text(dividerText,style: Theme.of(context).textTheme.labelMedium,),
        Expanded(
          child: Divider(
            color: dark ? AppColor.kDarkgrey : AppColor.grey,
            thickness: 0.5,
            indent: 20,
            endIndent: 20,
          ),
        ),
      ],
    );
  }
}