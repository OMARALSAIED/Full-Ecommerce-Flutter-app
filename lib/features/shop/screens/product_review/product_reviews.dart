import 'package:ecommerce/common/wigets/app_bar/appbar.dart';
import 'package:ecommerce/features/shop/screens/product_review/widgets/ORatingBarIndicator.dart';
import 'package:ecommerce/features/shop/screens/product_review/widgets/OverallProdcuRating.dart';
import 'package:ecommerce/features/shop/screens/product_review/widgets/user_review_card.dart';

import 'package:ecommerce/util/constants/size.dart';

import 'package:flutter/material.dart';

class ProductReviews extends StatelessWidget {
  const ProductReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppbar(
        title: Text(
          'Reviews And Rating',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(TSize.defaultspace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rating and reviews are verifed and are from prople who use the same type of device that you use',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: TSize.spaceBtweenItems),
            OverallProdcuRating(),
            ORatingBarIndicator(rating: 3.5,),
            Text('12,625', style: Theme.of(context).textTheme.bodySmall),
             SizedBox(height: TSize.spaceBtwSections),

            UserReviewCard(),
            const SizedBox(height: TSize.spaceBtweenItems,),
            UserReviewCard(),
            const SizedBox(height: TSize.spaceBtweenItems,),
             UserReviewCard(),
            const SizedBox(height: TSize.spaceBtweenItems,),
            UserReviewCard(),
          ],
        ),
      ),
    );
  }
}


