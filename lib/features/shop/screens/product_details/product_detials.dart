import 'package:ecommerce/common/wigets/text/sction_heading.dart';
import 'package:ecommerce/features/shop/screens/product_details/widgets/BottomAddtoCart.dart';
import 'package:ecommerce/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:ecommerce/features/shop/screens/product_details/widgets/product_image_slider.dart';
import 'package:ecommerce/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ecommerce/features/shop/screens/product_details/widgets/reating_andShare.dart';
import 'package:ecommerce/features/shop/screens/product_review/product_reviews.dart';
import 'package:ecommerce/util/constants/size.dart';

import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetialsScreen extends StatelessWidget {
  const ProductDetialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperfunction.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Bottomaddtocart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductImageSlider(dark: dark),
            Padding(
              padding: EdgeInsets.only(
                right: TSize.defaultspace,
                left: TSize.defaultspace,
                top: TSize.defaultspace,
              ),
              child: Column(
                children: [
                  RatingAndshare(),
                  ProductMetaData(),
                  ProductAttributes(),
                  const SizedBox(height: TSize.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("CheckOut"),
                    ),
                  ),
                  const SizedBox(height: TSize.spaceBtwSections),
                  const TSectionHeading(title: 'Description'),
                  const SizedBox(height: TSize.spaceBtwSections),
                  ReadMoreText(
                    "Featuring an ultra-lightweight frame and shock-absorbing sole tech, these shoes are designed to keep you moving fast, whether you're hitting the pavement or dominating the court.",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: 'Less',
                    moreStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Divider(),
                  const SizedBox(height: TSize.spaceBtweenItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TSectionHeading(title: 'Reviews(199)', onPressed: () {
                     
                      }),
                      IconButton(onPressed: (){   Get.to(ProductReviews());}, icon: Icon(Iconsax.arrow_right_3,size: 18,))
                    ],
                  ),
                  const SizedBox(height: TSize.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
