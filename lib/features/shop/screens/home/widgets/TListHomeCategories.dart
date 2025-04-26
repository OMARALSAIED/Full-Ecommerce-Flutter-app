import 'package:ecommerce/common/wigets/TverticalImageTextCategories/TverticalImageTextCategories.dart';
import 'package:ecommerce/features/shop/screens/sub_category/sub_category.dart';

import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/images_strings.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class TListHomeCategories extends StatelessWidget {
  const TListHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(
          right: TSize.spaceBtweenItems,
        ),
        itemBuilder: (_, index) {
          return TverticalImageTextCategories(image: TImage.shose,title: 'Shose Categores',textcolor: AppColor.kwhite,onTap: (){Get.to(SubCategoryScreen());},);
        },
      ),
    );
  }
}
