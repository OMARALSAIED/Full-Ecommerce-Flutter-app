import 'package:ecommerce/common/wigets/app_bar/appbar.dart';
import 'package:ecommerce/common/wigets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:ecommerce/common/wigets/icons/circularfav_icon.dart';
import 'package:ecommerce/common/wigets/images/TRoundedImage.dart';
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/images_strings.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgesWidget(
      child: Container(
        color: dark ? AppColor.kDarkgrey : AppColor.kwhite,
        child: Stack(
          children: [
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(
                  TSize.ProuductImageRaduis * 2,
                ),
                child: Center(
                  child: Image(image: AssetImage(TImage.sinekersrem)),
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
                  separatorBuilder: (_,__)=> const SizedBox(width: TSize.spaceBtweenItems,),
                  itemCount: 6,
                  itemBuilder: (_, index) {
                  return  TRoundedImage(
                    width: 80,
                    backgroundColor: dark ? AppColor.kblack : AppColor.kwhite,
                    showborder: true,
                    borderColor: AppColor.kPrimery,
                    padding: EdgeInsets.all(TSize.sm),
                    imageUrl: TImage.sinekersrem);
                  },
                  
                ),
              ),
            ),
            TAppbar(
              showBackArrow: true,
              actions: [
                const SizedBox(width:250,),
                CircularFavIcon(icon: Iconsax.heart5,color: AppColor.kred,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
