import 'package:ecommerce/common/wigets/products/cart/ProductQuantityWithAddAndRemove.dart';
import 'package:ecommerce/common/wigets/products/cart/card_item.dart';
import 'package:ecommerce/common/wigets/text/product_price_text.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:flutter/material.dart';

class CarditemsList extends StatelessWidget {
  const CarditemsList({
    this.showAddRemoveButtons = true,
    super.key,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder:
          (_, __) => const SizedBox(height: TSize.spaceBtwSections),
      itemCount: 2,
      itemBuilder:
          (_, index) => Column(
            children: [
              OCardItem(),
              if(showAddRemoveButtons)  SizedBox(height: TSize.spaceBtweenItems,),
               if(showAddRemoveButtons)  Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                   
                    children: [
                   const SizedBox(width: 70),
                    ProductQuantityWithAddAndRemove(),
                    
                    ],
                  ),
                  ProductPriceText(price: '255')
                ],
              )
            ],
          ),
    );
  }
}

