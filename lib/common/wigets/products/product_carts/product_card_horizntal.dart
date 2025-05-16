import 'package:ecommerce/common/wigets/custom_shapes/rounded_conatiner.dart';
import 'package:ecommerce/common/wigets/images/TRoundedImage.dart';
import 'package:ecommerce/common/wigets/products/product_carts/favourit_icon.dart';
import 'package:ecommerce/common/wigets/text/brandTitleWithVerifiedIcon.dart';
import 'package:ecommerce/common/wigets/text/product_price_text.dart';
import 'package:ecommerce/common/wigets/text/product_title_text.dart';
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/images_strings.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProdcutCardHorizntal extends StatelessWidget {
  const TProdcutCardHorizntal({super.key});

  

  @override
  Widget build(BuildContext context) {
    final dark = THelperfunction.isDarkMode(context);
    return Container(
      width: 330,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        // boxShadow: [TShadowStyle.verticalProductShadoow],
        borderRadius: BorderRadius.circular(TSize.ProuductImageRaduis),
        color: dark ? AppColor.kDarkergrey : AppColor.kwhite,
      ),
      child: Row(
        children: [
          TRoundedContainer(
            height: 120,
          
            backgroundColor: dark ? AppColor.kblack : AppColor.kwhite,
            child: Stack(
              children: [
                SizedBox(
                  height: 120,
                  width: 120,
                  child: TRoundedImage(
                    imageUrl: TImage.shose1,
                    applyImageReduise: true,
                    borderRadius: TSize.cardRadiusLg,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  top: 12,

                  child: TRoundedContainer(
                    borderRadius: TSize.sm,
                    backgroundColor: AppColor.kSecondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: TSize.sm,
                      vertical: TSize.xs,
                    ),
                    child: Text(
                      "25%",
                      style: Theme.of(
                        context,
                      ).textTheme.labelLarge!.apply(color: AppColor.kblack),
                    ),
                  ),
                ),

                //--Favorite icon
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 160,

                  child: FavourIcon(prooductId:'',)
                ),
              ],
            ),
          ),
          const SizedBox(width: TSize.spaceBtweenItems/3,),

          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: TSize.sm,left: TSize.sm),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    tProductTitleText(title: 'Green Nike Half Sleeves Shrit',smallsize: true,),
                    SizedBox(height: TSize.spaceBtweenItems/2,),
                    BrandTitleWithVerifiedIcon(title: 'Nike',textcolor:AppColor.kDarkgrey ,)
                    ],),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Flexible(child: ProductPriceText(price: '256')),

                    Container(
              decoration: BoxDecoration(
                color: AppColor.kblack,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(TSize.cardRadiusMg,),
                bottomRight: Radius.circular(TSize.ProuductImageRaduis)
                ),
                
              ),
              child: SizedBox(
                width: TSize.iconlg*1.2,
                height: TSize.iconlg*1.2,
                child:  Center(child: Icon(Iconsax.add,color: AppColor.kwhite,))),
            )
                  ],)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
