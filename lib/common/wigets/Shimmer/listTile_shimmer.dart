import 'package:ecommerce/common/wigets/Shimmer/shimmer_loader.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:flutter/material.dart';

class ListtileShimmer extends StatelessWidget {
  const ListtileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        OShimmereffect(width: 50, height: 50),
        SizedBox(width:TSize.spaceBtweenItems,),
        Column(children: [
          OShimmereffect(width: 100, height: 15),
          SizedBox(height: TSize.spaceBtweenItems/2,),
          OShimmereffect(width: 80, height: 12)
        ],)
      ],)
    ],);
  }
}