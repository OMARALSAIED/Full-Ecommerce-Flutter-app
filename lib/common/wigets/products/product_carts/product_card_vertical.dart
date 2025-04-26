
import 'package:ecommerce/common/wigets/custom_shapes/rounded_conatiner.dart';
import 'package:ecommerce/common/wigets/icons/circularfav_icon.dart';

import 'package:ecommerce/common/wigets/images/TRoundedImage.dart';
import 'package:ecommerce/common/wigets/text/brandTitleWithVerifiedIcon.dart';
import 'package:ecommerce/common/wigets/text/product_price_text.dart';
import 'package:ecommerce/common/wigets/text/product_title_text.dart';
import 'package:ecommerce/features/shop/screens/product_details/product_detials.dart';

import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/images_strings.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

import 'package:iconsax/iconsax.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperfunction.isDarkMode(context);

    return GestureDetector(
      onTap: () {
        Get.to(ProductDetialsScreen());
      },
      child: Container(
        width:180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          // boxShadow: [TShadowStyle.verticalProductShadoow],
          borderRadius: BorderRadius.circular(TSize.ProuductImageRaduis),
          color: dark ? AppColor.kDarkergrey : AppColor.kwhite,
        ),
        child: Column(
         
          children: [
            TRoundedContainer(
              height: 180,
               padding: const EdgeInsets.all(TSize.sm),
              backgroundColor: dark ?AppColor.kDark :AppColor.kwhite,
              shadow: [
                 BoxShadow(
      color: Colors.black.withOpacity(0.1), // لون الظل
      blurRadius: 10, // نعومة الظل
      offset: Offset(0, 4), // مكان الظل (أفقي، عمودي)
    ),
              ],
              
              child: Stack(
                children:[
                  TRoundedImage(imageUrl: TImage.sinekersrem, applyImageReduise: true),
                  //Sale tag
                  Positioned(
                    top: 8,
                    left: 0,
                    child: TRoundedContainer(
                      backgroundColor: AppColor.kSecondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: TSize.sm,vertical: TSize.xs),
                      child: Text("25%",style: Theme.of(context).textTheme.labelLarge!.apply(color: AppColor.kblack),),
                    ),
                  ),
                  //--Favorite icon
                  
                  Positioned(
                    right: 0,
                    top: 0,
                    bottom: 160,
                    
                    child: CircularFavIcon(icon: Iconsax.heart5,color: AppColor.kred,),
                  )
                  
           ] ),
            ),
            
      const SizedBox(height: TSize.spaceBtweenItems/2,),
          Padding(padding:  EdgeInsets.only(left: TSize.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
           tProductTitleText(title:'Green Nike Air Shose'),

         const SizedBox(height: TSize.spaceBtweenItems/2,),
         BrandTitleWithVerifiedIcon(title: 'Nike',textcolor: AppColor.grey,)
      
              ],
            ),
            
            ),
            Spacer(),
               Row(
               
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Padding(
              padding: const EdgeInsets.only(left: TSize.sm),
              child: ProductPriceText(price: '35.5',),
            ),
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
            
            ],
           )
          ],
        ),
      ),
    );
  }
}



