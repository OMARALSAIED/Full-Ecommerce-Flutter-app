import 'package:ecommerce/common/wigets/layout/grid_layout.dart';
import 'package:ecommerce/common/wigets/products/product_carts/product_card_vertical.dart';
import 'package:ecommerce/features/shop/controllers/product/all_products_controller.dart';
import 'package:ecommerce/features/shop/models/ProductModel.dart';

import 'package:ecommerce/util/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:iconsax/iconsax.dart';

class SortableProduct extends StatelessWidget {
  const SortableProduct({super.key, required this.product});

  final List<ProductModel> product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    controller.assignProduct(product);
    return Column(
      children: [
        DropdownButtonFormField(
      
          onChanged: (val) {
            controller.sortProducts(val!);
          },
          value: controller.selectedSortOption.value,
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
              items:
              [
                    'Name',
                    'Higher Price',
                    'Lower Price',
                    'Sale',
                    'Newest',
                    'Popularty',
                  ]
                  .map(
                    (opition) =>
                        DropdownMenuItem(value: opition, child: Text(opition)),
                  )
                  .toList(),
        ),
        
        const SizedBox(height: TSize.spaceBtwSections),
        Obx(
          () => GridViewLayout(
            itemCount: controller.products.length,
            itemBuilder:
                (_, index) => ProductCardVertical(product: product[index]),
          ),
        ),
      ],
    );
  }
}
