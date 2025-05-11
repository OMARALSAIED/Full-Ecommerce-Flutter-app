import 'package:ecommerce/common/wigets/custom_shapes/choice_ship.dart';
import 'package:ecommerce/common/wigets/custom_shapes/rounded_conatiner.dart';
import 'package:ecommerce/common/wigets/text/sction_heading.dart';
import 'package:ecommerce/features/shop/controllers/product/VariationController.dart';
import 'package:ecommerce/features/shop/models/ProductModel.dart';

import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperfunction.isDarkMode(context);
    final controller = Get.put(Variationcontroller());

    /// قم بتأخير التحديث للتأكد من أن البناء قد اكتمل
    Future.delayed(Duration.zero, () {
      if (controller.selectedAttributes.isEmpty) {
        controller.setInitialSelection(product);
      }
    });

    return Column(
      children: [
        if (controller.selectedVariation.value.id.isNotEmpty)
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
                              Text(
                                'Price: \$${controller.selectedVariation.value.salePrice}',
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Stock: ${controller.variationStockStatus.value}',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
         const SizedBox(height: TSize.spaceBtweenItems),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: product.productAttributes!.map((attribute) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TSectionHeading(
                  title: attribute.name ?? '',
                  showActionButton: false,
                  width: 275,
                ),
                SizedBox(height: TSize.spaceBtweenItems / 2),
                Obx(() {
                  return Wrap(
                    spacing: 8,
                    children: attribute.values!.map((attributeValue) {
                      final isSelected =
                          controller.selectedAttributes[attribute.name] == attributeValue;

                      return OChoiceChip(
                        title: attributeValue,
                        selected: isSelected,
                        onSelected: (selected) {
                          if (selected) {
                            controller.onAttributeSelected(
                              product,
                              attribute.name ?? '',
                              attributeValue,
                            );
                          }
                        },
                      );
                    }).toList(),
                  );
                }),
                SizedBox(height: TSize.spaceBtweenItems / 2),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}