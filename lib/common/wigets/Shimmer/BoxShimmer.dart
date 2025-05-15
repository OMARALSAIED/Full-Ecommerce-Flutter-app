import 'package:ecommerce/common/wigets/Shimmer/shimmer_loader.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:flutter/material.dart';

class Boxshimmer extends StatelessWidget {
  const Boxshimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        Expanded(child:OShimmereffect(width: 150, height: 110)),
        SizedBox(width: TSize.spaceBtweenItems,),
         Expanded(child:OShimmereffect(width: 150, height: 110)),
          SizedBox(width: TSize.spaceBtweenItems,),
          Expanded(child:OShimmereffect(width: 150, height: 110)),
      ],)
    ],);

  }
}