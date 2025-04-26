import 'package:ecommerce/features/shop/screens/product_review/widgets/RatingProgressIndicatorcus.dart';
import 'package:flutter/material.dart';

class OverallProdcuRating extends StatelessWidget {
  const OverallProdcuRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('4.8', style: Theme.of(context).textTheme.displayLarge),
        Expanded(
          child: Column(
            children: [
              RatingProgressIndicatorcus(text: '5',value:1.0 ,),
              RatingProgressIndicatorcus(text: '4',value:0.8 ,),
              RatingProgressIndicatorcus(text: '3',value:0.6 ,),
              RatingProgressIndicatorcus(text: '2',value:0.4 ,),
              RatingProgressIndicatorcus(text: '1',value:0.2 ,),
            ],
          ),
        ),
      ],
    );
  }
}

