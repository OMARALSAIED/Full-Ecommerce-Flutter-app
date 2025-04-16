import 'package:ecommerce/common/styles/shadow.dart';
import 'package:ecommerce/common/wigets/custom_shapes/rounded_conatiner.dart';
import 'package:ecommerce/common/wigets/icons/circularfav_icon.dart';

import 'package:ecommerce/common/wigets/images/TRoundedImage.dart';

import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/images_strings.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperfunction.isDarkMode(context);

    return Container(
      width: 180,
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
           
            
            child: Stack(
              children:[
                TRoundedImage(imageUrl: TImage.sinekersrem, applyImageReduise: true),
                //Sale tag
                Positioned(
                  top: 12,
                  child: TRoundedContainer(
                    backgroundColor: AppColor.kSecondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(horizontal: TSize.sm,vertical: TSize.xs),
                    child: Text("25%",style: Theme.of(context).textTheme.labelLarge!.apply(color: AppColor.kblack),),
                  ),
                ),
                //--Favorite icon

                Positioned(
                  right: 1,
                  child: CircularFavIcon(dark: dark),
                )
                
         ] ),
          ),
          
        ],
      ),
    );
  }
}

