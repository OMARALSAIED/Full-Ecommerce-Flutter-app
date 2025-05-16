import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/common/wigets/app_bar/appbar.dart';
import 'package:ecommerce/common/wigets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:ecommerce/common/wigets/images/TRoundedImage.dart';
import 'package:ecommerce/common/wigets/products/product_carts/favourit_icon.dart';
import 'package:ecommerce/features/shop/controllers/product/images_controller.dart';
import 'package:ecommerce/features/shop/models/ProductModel.dart';
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';


class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
    required this.product,
    required this.dark,
  });
  final ProductModel product;

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);
    return TCurvedEdgesWidget(
      child: Container(
        color: dark ? AppColor.kDarkgrey : AppColor.kwhite,
        child: Stack(
          children: [
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(TSize.ProuductImageRaduis * 2),
                child: Center(
                  child: Obx(() {
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: () => controller.showEnlargeImage(image),
                      child: CachedNetworkImage(imageUrl: image),
                    );
                  }),
                ),
              ),
            ),
            Positioned(
              right: 0,
              left: 30,
              bottom: 30,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,

                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder:
                      (_, __) => const SizedBox(width: TSize.spaceBtweenItems),
                  itemCount: images.length,
                  itemBuilder:
                      (_, index) => Obx(() {
                        // ignore: unused_local_variable
                        final imageseleCted =
                            controller.selectedProductImage.value ==
                            images[index];
                        return TRoundedImage(
                          width: 80,
                          isNetworkimage: true,
                          backgroundColor:
                              dark ? AppColor.kDark : AppColor.kwhite,
                          borderColor: AppColor.kPrimery,
                          padding: const EdgeInsets.all(TSize.sm),
                          imageUrl: images[index],

                          onPressed:
                              () =>
                                  controller.selectedProductImage.value =
                                      images[index],
                        );
                      }),
                ),
              ),
            ),
            TAppbar(
              showBackArrow: true,
              actions: [
                const SizedBox(width: 250),
                FavourIcon(prooductId: product.id,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
