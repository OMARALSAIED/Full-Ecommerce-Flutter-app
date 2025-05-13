import 'package:ecommerce/common/wigets/Shimmer/shimmer_loader.dart';
import 'package:ecommerce/common/wigets/layout/grid_layout.dart';
import 'package:flutter/material.dart';

class BrandsShimmer extends StatelessWidget {
  const BrandsShimmer({super.key,this.itemsCount=4});

  final int itemsCount;

  @override
  Widget build(BuildContext context) {
    return GridViewLayout(itemCount: itemsCount, itemBuilder: (_,__)=> OShimmereffect(width: 300, height: 80));
  }
}