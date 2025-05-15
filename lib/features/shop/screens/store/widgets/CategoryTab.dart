import 'package:ecommerce/common/wigets/Shimmer/vertical_product_shimmer.dart';
import 'package:ecommerce/common/wigets/layout/grid_layout.dart';
import 'package:ecommerce/common/wigets/products/product_carts/product_card_vertical.dart';
import 'package:ecommerce/common/wigets/text/sction_heading.dart';
import 'package:ecommerce/features/shop/controllers/category.controller.dart';
import 'package:ecommerce/features/shop/models/category_model.dart';
import 'package:ecommerce/features/shop/screens/all_Products/all_products.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/helpers/cloudHelper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.insatnce;
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(TSize.defaultspace),
          child: FutureBuilder(
            future: controller.getCategoryProdycts(categoryId: category.id),
            builder: (context, snapshot) {
              final response = CloudhelperFunction.checkMultieRecordSate(
                snapshot: snapshot,
                loader: const VerticalProductShimmer(),
              );
              if (response != null) return response;
              final products = snapshot.data!;
              return Column(
                children: [
                  const SizedBox(height: TSize.spaceBtweenItems),
                  // You can add more content here depending on tab
                  TSectionHeading(
                    title: 'You might like',
                    onPressed:
                        () =>Get.to(AllProducts(
                        
                          title: category.Name,
                          futuerMethod: controller.getCategoryProdycts(
                            categoryId: category.id,
                            limit: -1,
                          ),
                        ),), 
                    showActionButton: true,
                    width: 160,
                  ),
                  const SizedBox(height: TSize.spaceBtweenItems),
                  GridViewLayout(
                    itemCount: products.length,
                    itemBuilder:
                        (_, index) =>
                            ProductCardVertical(product: products[index]),
                  ),
                  const SizedBox(height: TSize.spaceBtwSections),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
