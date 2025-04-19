import 'package:ecommerce/features/shop/screens/product_details/widgets/product_image_slider.dart';
import 'package:ecommerce/features/shop/screens/product_details/widgets/reating_andShare.dart';
import 'package:ecommerce/util/constants/size.dart';

import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';


class ProductDetialsScreen extends StatelessWidget {
  const ProductDetialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperfunction.isDarkMode(context);
    return Scaffold(
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
                
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

