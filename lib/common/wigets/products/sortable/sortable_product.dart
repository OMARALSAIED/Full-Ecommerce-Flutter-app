
import 'package:ecommerce/common/wigets/layout/grid_layout.dart';
import 'package:ecommerce/common/wigets/products/product_carts/product_card_vertical.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SortableProduct extends StatelessWidget {
  const SortableProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
         DropdownButtonFormField(
          items: ['Name','Higher Price','Lower Price','Sale','Newest','Popularty'  ].map((opition)=>DropdownMenuItem(value: opition,child :Text(opition))).toList(), onChanged: (val){},
          decoration: const InputDecoration(prefixIcon:Icon(Iconsax.sort) ),
          
          ),
          const SizedBox(height: TSize.spaceBtwSections,),
          GridViewLayout(itemCount: 6, itemBuilder: (_,index)=>ProductCardVertical())
    ],);
  }
}