import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/common/wigets/Shimmer/shimmer_loader.dart';
import 'package:ecommerce/common/wigets/custom_shapes/circular_Container.dart';
import 'package:ecommerce/common/wigets/images/TRoundedImage.dart';
import 'package:ecommerce/features/shop/controllers/banner_controller.dart';
import 'package:ecommerce/features/shop/controllers/home_controller.dart';
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class TPromoSlider extends StatelessWidget {
  TPromoSlider({super.key});
  final controller = Get.put(HomeController());
  

  @override
  Widget build(BuildContext context) {
    final bannerController=Get.put(BannerController());
    return Obx(
      (){
        if(bannerController.isLoading.value) return  OShimmereffect(width: double.infinity, height: 190);
        if(bannerController.banners.isEmpty)
        {
          return const Center(child: Text('No Data Found!'),);
        }
        return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
            viewportFraction: 1,
          ),
          items:
              bannerController.banners
                  .map(
                    (banner) => TRoundedImage(

                      imageUrl: banner.imageUrl ?? '',
                     
                      isNetworkimage: true,
                      borderRadius: TSize.cardRadiusLg,
                      applyImageReduise: true,
                      fit: BoxFit.cover,
                      onPressed: (){
                        
                        // print("Image URL: ${banner.imageUrl}");

                        Get.toNamed(banner.targetScreen);},
                    ),
                  )
                  .toList(),
        ),

        const SizedBox(height: TSize.spaceBtweenItems),
        Obx(
          () => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < bannerController.banners.length; i++)
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
    );
  }
}