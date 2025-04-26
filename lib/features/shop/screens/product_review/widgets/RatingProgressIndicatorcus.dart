import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:flutter/material.dart';

class RatingProgressIndicatorcus extends StatelessWidget {
  const RatingProgressIndicatorcus({
    super.key, required this.text, required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        const SizedBox(width: 8),
        // هذا هو التعديل
        Expanded(
          flex: 9,
          child: Container(
            width:
                MediaQuery.of(context).size.width *
                0.6, // خليه ياخذ 60% من الشاشة
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: LinearProgressIndicator(
                value: value, // 50%
                minHeight: 11,
                backgroundColor: AppColor.kPrimery.withOpacity(
                  0.2,
                ),
                valueColor: AlwaysStoppedAnimation(
                  AppColor.kPrimery,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
