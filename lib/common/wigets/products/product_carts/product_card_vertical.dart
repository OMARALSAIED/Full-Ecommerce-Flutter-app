import 'package:ecommerce/common/wigets/custom_shapes/rounded_conatiner.dart';
import 'package:ecommerce/common/wigets/images/TRoundedImage.dart';
import 'package:ecommerce/common/wigets/products/product_carts/favourit_icon.dart';
import 'package:ecommerce/common/wigets/text/brandTitleWithVerifiedIcon.dart';
import 'package:ecommerce/common/wigets/text/product_price_text.dart';
import 'package:ecommerce/common/wigets/text/product_title_text.dart';
import 'package:ecommerce/features/shop/controllers/product/product_controller.dart';
import 'package:ecommerce/features/shop/models/ProductModel.dart';
import 'package:ecommerce/features/shop/screens/product_details/product_detials.dart';
import 'package:ecommerce/util/constants/AppColors.dart';

import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';

import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardVertical extends StatelessWidget {
  ProductCardVertical({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(
      product.price,
      product.salePrice,
    );
    final dark = THelperfunction.isDarkMode(context);

    return GestureDetector(
      onTap: () {
        Get.to(ProductDetialsScreen(product: product));
      },
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSize.ProuductImageRaduis),
          color: dark ? AppColor.kDarkergrey : AppColor.kwhite,
        ),
        child: Column(
          children: [
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSize.sm),
              backgroundColor: dark ? AppColor.kDark : AppColor.kwhite,
              child: Stack(
                children: [
                  Center(
                    child: TRoundedImage(
                      imageUrl: product.thumbnail,
                      applyImageReduise: true,
                      isNetworkimage: true,
                    ),
                  ),
                  if(salePercentage!=null)
                  Positioned(
                    top: 8,
                    left: 0,
                    child: TRoundedContainer(
                      backgroundColor: AppColor.kSecondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: TSize.sm,
                        vertical: TSize.xs,
                      ),
                      child: Text(
                        // ignore: unnecessary_null_comparison
                        salePercentage != null ? "$salePercentage%" : '',
                        style: Theme.of(context).textTheme.labelLarge!.apply(
                          color: AppColor.kblack,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: FavourIcon(prooductId: product.id,),
                  ),
                ],
              ),
            ),

            const SizedBox(height: TSize.spaceBtweenItems / 2),
            Padding(
              padding: const EdgeInsets.only(left: TSize.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  tProductTitleText(title: product.title),
                  const SizedBox(height: TSize.spaceBtweenItems / 2),
                  BrandTitleWithVerifiedIcon(
                    title: product.brand?.Name ?? 'Unknown Brand',
                    textcolor: AppColor.grey,
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: TSize.sm),
                    child: ProductPriceText(
                      price: controller.getProductPrice(product),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.kblack,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSize.cardRadiusMg),
                      bottomRight: Radius.circular(TSize.ProuductImageRaduis),
                    ),
                  ),
                  child: SizedBox(
                    width: TSize.iconlg * 1.2,
                    height: TSize.iconlg * 1.2,
                    child: Center(
                      child: Icon(Iconsax.add, color: AppColor.kwhite),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

