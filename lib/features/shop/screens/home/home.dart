
import 'package:ecommerce/common/wigets/Shimmer/shimmer_loader.dart';
import 'package:ecommerce/common/wigets/custom_shapes/primary_header_contianer.dart';
import 'package:ecommerce/common/wigets/custom_shapes/search_container.dart';
import 'package:ecommerce/common/wigets/layout/grid_layout.dart';
import 'package:ecommerce/common/wigets/products/product_carts/product_card_vertical.dart';
import 'package:ecommerce/common/wigets/text/sction_heading.dart';
import 'package:ecommerce/features/shop/controllers/product/product_controller.dart';
import 'package:ecommerce/features/shop/screens/all_Products/all_products.dart';
import 'package:ecommerce/features/shop/screens/home/widgets/TListHomeCategories.dart';
import 'package:ecommerce/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecommerce/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContianer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeAppbar(),
                  const SizedBox(height: TSize.spaceBtwSections),

                  TSearchContainer(
                    icon: Iconsax.search_normal,
                    text: "Search in Store",
                    showBorder: true,
                    showBackground: true,
                  ),

                  const SizedBox(height: TSize.spaceBtwSections),
                  //Categories
                  Padding(
                    padding: const EdgeInsets.only(left: TSize.defaultspace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TSectionHeading(
                          title: "Popular Categories", // ✅ Fixed typo here
                          textcolor: Colors.white,
                          onPressed: () {
                            
                          },
                          showActionButton: true,
                        ),

                        TListHomeCategories(),
                        const SizedBox(height: TSize.xl),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(TSize.defaultspace),
              child: Column(
                children: [
                  //--Promo Silder
                  TPromoSlider(), //banners: [TImage.baner1,TImage.shose,TImage.nikee],
                  const SizedBox(height: TSize.md),
                  TSectionHeading(
                    title: 'Popular Products',
                    onPressed: () {
                      Get.to(
                        AllProducts(
                          title: 'Popular Products',
                         
                          futuerMethod: controller.fetchAllFeaturedProduct(),
                        ),
                      );
                    },
                    showActionButton: true,
                  ),

                  Obx(() {
                    if (controller.isLoading.value) {
                      return OShimmereffect(width: 55, height: 55);
                    }

                    if (controller.featuredProducts.isEmpty) {
                      return Center(
                        child: Text(
                          'No data Found!',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    }

                    return GridViewLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (_, index) {
                        return ProductCardVertical(
                          product: controller.featuredProducts[index],
                        );
                      },
                      mainAxisExtent: 288,
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
