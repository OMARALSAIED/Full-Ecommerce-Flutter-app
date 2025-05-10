import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/features/shop/models/ProductModel.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  RxString selectedProductImage=''.obs;

  //Get all images from product and variation

  List<String> getAllProductImages(ProductModel product) {
  
  Set<String> images = {};

  // إضافة الصورة الرئيسية (thumbnail)
  if (product.thumbnail.isNotEmpty) {
    images.add(product.thumbnail);
   
    selectedProductImage.value = product.thumbnail;
  }

  // إضافة الصور الأخرى
  if (product.images != null && product.images!.isNotEmpty) {
    images.addAll(product.images!);
  }

  // إضافة صور الفاريشن
  if (product.productVariation != null && product.productVariation!.isNotEmpty) {
    images.addAll(
      product.productVariation!
          .map((variation) => variation.image)
          
    );
  }
  

  print('The images list $images');
  return images.toList();
}


  void showEnlargeImage(String image)
  {
     Get.to(()=>Dialog.fullscreen(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
             Padding(padding: 
             EdgeInsets.symmetric(vertical: TSize.defaultspace *2,horizontal: TSize.defaultspace),
             child: CachedNetworkImage(imageUrl: image),
             ),
             const SizedBox(height: TSize.spaceBtwSections,),
             Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(onPressed: ()=> Get.back(), child: const Text('Close')),
              ),
             )
      ],),
     ));
  }
}