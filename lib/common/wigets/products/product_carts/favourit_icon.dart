import 'package:ecommerce/common/wigets/icons/circularfav_icon.dart';
import 'package:ecommerce/features/shop/controllers/product/favourit_controller.dart';
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class FavourIcon extends StatelessWidget {
  const FavourIcon({
    super.key, required this.prooductId,
  });
  final String prooductId;

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(FavouritController());
    return Obx(
      ()=> CircularFavIcon(
        icon:controller.isFavourite(prooductId)  ? Iconsax.heart5 : Iconsax.heart,
        color: controller.isFavourite(prooductId)  ? AppColor.kred : null,
        onPressed: (){
          controller.toggleFavouriteProduct(prooductId);
        },
      ),
    );
  }
}
