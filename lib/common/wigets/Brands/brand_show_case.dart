import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/common/wigets/Brands/Brand_card.dart';
import 'package:ecommerce/common/wigets/Shimmer/shimmer_loader.dart';
import 'package:ecommerce/common/wigets/custom_shapes/rounded_conatiner.dart';
import 'package:ecommerce/features/shop/models/BrandModel.dart';
import 'package:ecommerce/features/shop/screens/Brands/brand_product.dart';
import 'package:ecommerce/util/constants/AppColors.dart';

import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class BrandShowCase extends StatelessWidget {
  const BrandShowCase({
    required this.images,
    super.key, required this.brand,
  });
  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Get.to(()=>BrandProduct(brand: brand)),
      child: TRoundedContainer(
        padding: EdgeInsets.all(TSize.md),
        showborder: true,
        borderColo: AppColor.kDarkgrey,
        backgroundColor: AppColor.ktransparent,
        margin: const EdgeInsets.only(bottom: TSize.spaceBtweenItems),
        child:  Column(
          children: [
          TBrandCard(showborder: false,brand: brand,),
          const SizedBox(height: TSize.spaceBtweenItems,)
      ,
            Row(children: 
               
               images.map((image)=>brandTopProductImageWidget(image, context)).toList()
              
            ,)
          ],
        ),
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
                                            child:  CachedNetworkImage(
                                              fit: BoxFit.contain,

                                              imageUrl: image
                                              ,
                                              progressIndicatorBuilder: (context, url, downloadProgress) =>  OShimmereffect(width: 100, height: 100),
                                              errorWidget: (context, url, error) => const Icon(Icons.error),
                                              ),
                                            ),
              );
  }
}
