import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/common/wigets/custom_shapes/circular_Container.dart';

import 'package:ecommerce/common/wigets/images/TRoundedImage.dart';
import 'package:ecommerce/features/shop/controllers/home_controller.dart';

import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/images_strings.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class TPromoSlider extends StatelessWidget {
  TPromoSlider({super.key, required this.banners});
  final controller = Get.put(HomeController());
  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
            viewportFraction: 1,
          ),
          items:
              banners
                  .map(
                    (url) => TRoundedImage(
                      imageUrl: url,
                      borderRadius: TSize.cardRadiusLg,
                      applyImageReduise: true,
                      fit: BoxFit.cover,
                    ),
                  )
                  .toList(),
        ),

        const SizedBox(height: TSize.spaceBtweenItems),
        Obx(
          () => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < 3; i++)
                TCirculaContianer(
                  reaius: TSize.md,
                  width: 20,
                  height: 4,
                  backgroundColor:
                      controller.carousalCurrentInedx.value == i
                          ? AppColor.kPrimery
                          : AppColor.grey,
                  margin: EdgeInsets.only(right: 10),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
