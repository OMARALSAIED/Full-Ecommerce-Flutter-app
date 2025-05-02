import 'package:ecommerce/common/wigets/Shimmer/shimmer_loader.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:flutter/material.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        separatorBuilder:
            (_, __) => const SizedBox(width: TSize.spaceBtweenItems),
        itemBuilder: (_, __) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  OShimmereffect(width: 55, height: 55),
                  SizedBox(height: TSize.spaceBtweenItems/2,),
                  OShimmereffect(width: 55, height: 8)
          ],);
        },
      ),
    );
  }
}
