import 'package:ecommerce/common/wigets/Brands/Brand_card.dart';
import 'package:ecommerce/common/wigets/custom_shapes/rounded_conatiner.dart';
import 'package:ecommerce/features/shop/models/BrandModel.dart';
import 'package:ecommerce/util/constants/AppColors.dart';

import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class BrandShowCase extends StatelessWidget {
  const BrandShowCase({
    required this.images,
    super.key,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      padding: EdgeInsets.all(TSize.md),
      showborder: true,
      borderColo: AppColor.kDarkgrey,
      backgroundColor: AppColor.ktransparent,
      margin: const EdgeInsets.only(bottom: TSize.spaceBtweenItems),
      child:  Column(
        children: [
        TBrandCard(showborder: false,brand: BrandModel.empty(),),
        const SizedBox(height: TSize.spaceBtweenItems,)
    ,
          Row(children: 
             
             images.map((image)=>brandTopProductImageWidget(image, context)).toList()
            
          ,)
        ],
      ),
    );
  }


  Widget  brandTopProductImageWidget(String image ,BuildContext context)
  {
    return  Expanded(
                child: TRoundedContainer(
                showborder: false,
                height: 100,backgroundColor: THelperfunction.isDarkMode(context)  ?AppColor.kDarkergrey :AppColor.kwhite,
                                            margin: const EdgeInsets.only(right: TSize.sm),
                                            padding: const EdgeInsets.all(TSize.md),
                                            child:  Image(fit: BoxFit.contain,image:AssetImage(image)),
                                            ),
              );
  }
}
