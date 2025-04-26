import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class ORatingBarIndicator extends StatelessWidget {
  const ORatingBarIndicator({
   required this.rating,
    super.key,
  });
final  double rating ;
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
     rating: rating,
     itemSize: 20,
     itemBuilder: (_,__)=>Icon(Iconsax.star1,color: AppColor.kPrimery,),);
  }
}
