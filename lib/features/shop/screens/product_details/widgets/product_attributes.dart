import 'package:ecommerce/common/wigets/custom_shapes/choice_ship.dart';
import 'package:ecommerce/common/wigets/custom_shapes/rounded_conatiner.dart';
import 'package:ecommerce/common/wigets/text/product_title_text.dart';
import 'package:ecommerce/common/wigets/text/sction_heading.dart';

import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperfunction.isDarkMode(context);
    return Column(
      children: [
        TRoundedContainer(
          backgroundColor: dark ? AppColor.kgrey : AppColor.kgrey,

          child: Padding(
            padding: const EdgeInsets.all(TSize.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    TSectionHeading(title: 'variants'),
                    const SizedBox(width: TSize.spaceBtweenItems),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                tProductTitleText(
                                  title: 'Price : ',
                                  smallsize: true,
                                ),

                                Text(
                                  '\$250',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleSmall!.copyWith(
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                const SizedBox(width: TSize.spaceBtweenItems),
                                Text(
                                  '\$200',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            tProductTitleText(
                              title: 'Stock : ',
                              smallsize: true,
                            ),
                            Text(
                              'In Stock',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                tProductTitleText(
                  title:
                      'This is the Description of the product and it can go up to ',
                  smallsize: true,
                  maxLines: 4,
                ),
              ],
            ),
          ),
        ),
        Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TSectionHeading(
              title: 'Colors',
              showActionButton: true,
              width: 275,
            ),
            SizedBox(height: TSize.spaceBtweenItems / 2),
           Wrap(
            spacing: 8,
            children: [
             OChoiceChip(title: 'Green', selected: true, onSelected: (value) {}),
            OChoiceChip(title: 'Red', selected: false, onSelected: (value) {}),
            OChoiceChip(
              title: 'Black',
              selected: false,
              onSelected: (value) {},
            ),
         
           ],)
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TSectionHeading(title: 'Size', showActionButton: true, width: 295),
             SizedBox(height: TSize.spaceBtweenItems / 2),
           Wrap(
            spacing: 8,
            children: [
               
           
            OChoiceChip(title: 'EU 34', selected: true, onSelected: (value) {}),
            OChoiceChip(
              title: 'EU  36',
              selected: false,
              onSelected: (value) {},
            ),
            OChoiceChip(
              title: 'EU 38',
              selected: false,
              onSelected: (value) {},
            ),
           
          
            ],
           )
          ],
        ),
      ],
    );
  }
}
