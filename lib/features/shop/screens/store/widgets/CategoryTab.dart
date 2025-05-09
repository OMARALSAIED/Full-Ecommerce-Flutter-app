import 'package:ecommerce/common/wigets/Brands/brand_show_case.dart';
import 'package:ecommerce/common/wigets/layout/grid_layout.dart';
import 'package:ecommerce/common/wigets/products/product_carts/product_card_vertical.dart';
import 'package:ecommerce/common/wigets/text/sction_heading.dart';
import 'package:ecommerce/features/shop/models/ProductModel.dart';
import 'package:ecommerce/features/shop/models/category_model.dart';
import 'package:ecommerce/util/constants/images_strings.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:flutter/material.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    super.key, required this.category,
  });

  
final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children:[ Padding(
        padding: const EdgeInsets.all(TSize.defaultspace),
        child: Column(
          children: [

            BrandShowCase(images: [TImage.shrit,TImage.sinekersrem,TImage.shose],),
            BrandShowCase(images: [TImage.shrit,TImage.sinekersrem,TImage.shose],),
            const SizedBox(height: TSize.spaceBtweenItems,),
            // You can add more content here depending on tab
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: TSectionHeading(title: 'You might like', onPressed: () {},showActionButton: true,width: 160,),
            ),
            const SizedBox(height: TSize.spaceBtweenItems,),
            GridViewLayout(itemCount: 4, itemBuilder: (_,index)=> ProductCardVertical(product: ProductModel.empty(),)),
            const SizedBox(height: TSize.spaceBtwSections,),
          ],
        ),
          ),
    ]);
  }
}
