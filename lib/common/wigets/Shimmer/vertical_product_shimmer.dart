
import 'package:ecommerce/common/wigets/Shimmer/shimmer_loader.dart';
import 'package:ecommerce/common/wigets/layout/grid_layout.dart';
import 'package:ecommerce/util/constants/size.dart';

import 'package:flutter/material.dart';

class VerticalProductShimmer extends StatelessWidget {
  const VerticalProductShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridViewLayout(
      itemCount: itemCount,
    
        itemBuilder: (_, __) => SizedBox(
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               OShimmereffect(width: 180, height: 180),
               SizedBox(height: TSize.spaceBtweenItems,),
                OShimmereffect(width: 160, height: 15),
               SizedBox(height: TSize.spaceBtweenItems/2),
               OShimmereffect(width: 110, height: 15)
          ],),
        )
    );
  }
}
