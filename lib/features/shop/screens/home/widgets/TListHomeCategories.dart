import 'package:ecommerce/common/wigets/Shimmer/category_shimmer.dart';
import 'package:ecommerce/common/wigets/TverticalImageTextCategories/TverticalImageTextCategories.dart';
import 'package:ecommerce/features/shop/controllers/category.controller.dart';
import 'package:ecommerce/features/shop/screens/sub_category/sub_category.dart';

import 'package:ecommerce/util/constants/AppColors.dart';

import 'package:ecommerce/util/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class TListHomeCategories extends StatelessWidget {
  const TListHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());

    return Obx(() {
      if (controller.isLoading.value) return CategoryShimmer();
      if (controller.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            'No Data Found',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.apply(color: AppColor.kwhite),
          ),
        );
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(right: TSize.spaceBtweenItems),
          itemBuilder: (_, index) {
            final category = controller.featuredCategories[index];
            return TverticalImageTextCategories(
              image: category.Image,
              title: category.Name,
              textcolor: AppColor.kwhite,
              onTap: () {
                Get.to(SubCategoryScreen());
              },
            );
          },
        ),
      );
    });
  }
}
