
import 'package:ecommerce/util/constants/size.dart';
import 'package:flutter/material.dart';

class GridViewLayout extends StatelessWidget {
  const GridViewLayout({
    super.key, required this.itemCount, this.mainAxisExtent=288
    
    , required this.itemBuilder,
  });

  @override

  final int itemCount;
  final double ? mainAxisExtent;
  final Widget ? Function(BuildContext ,int ) itemBuilder;
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
    mainAxisSpacing: TSize.graidViewspacing,
    crossAxisSpacing: TSize.graidViewspacing,
    
    mainAxisExtent: mainAxisExtent
    
    ),
    itemBuilder:itemBuilder,
    
    
    );
  }
}

