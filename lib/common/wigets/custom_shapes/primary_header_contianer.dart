import 'package:ecommerce/common/wigets/custom_shapes/circular_Container.dart';
import 'package:ecommerce/common/wigets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:flutter/material.dart';


class TPrimaryHeaderContianer extends StatelessWidget {
  const TPrimaryHeaderContianer({
  required  this.child,
    super.key,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgesWidget(child: SizedBox(
     
        child: Container(
          color: AppColor.kPrimery,
          child: Stack(
          
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: TCirculaContianer(
                backgroundColor: AppColor.kwhite.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: TCirculaContianer(
                backgroundColor: AppColor.kwhite.withOpacity(0.1),
              ),
            ),
            child
          ],
                ),
        ),
    ),);
  }
}


