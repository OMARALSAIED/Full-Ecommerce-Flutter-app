import 'package:ecommerce/common/wigets/Animation/animation.dart';
import 'package:ecommerce/common/wigets/Shimmer/vertical_product_shimmer.dart';
import 'package:ecommerce/common/wigets/app_bar/appbar.dart';
import 'package:ecommerce/common/wigets/icons/circularfav_icon.dart';
import 'package:ecommerce/common/wigets/layout/grid_layout.dart';
import 'package:ecommerce/common/wigets/products/product_carts/product_card_vertical.dart';
import 'package:ecommerce/features/shop/controllers/product/favourit_controller.dart';

import 'package:ecommerce/navigation_menu.dart';
import 'package:ecommerce/util/constants/images_strings.dart';

import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/helpers/cloudHelper_function.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
 FavouriteScreen({super.key});
  final controller=Get.put(FavouritController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppbar(
        title: Text('Wishlist',style: Theme.of(context).textTheme.headlineMedium,),

        actions: [
          CircularFavIcon(icon: Iconsax.add,)
        ],
      )
      ,
      body: 
      SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSize.defaultspace),
        child: Obx(
          ()=> FutureBuilder(
            future: controller.favoriteProduct(),
            
            
            builder: (context, snapshot) {
           
              final emptyWidget=AnimationLoaderWidget(text: 'Whoop! Wishlist is Empty...', animation: TImage.loading,showicon: true,actionText: 'Let s add some',
              onActionPressed: () => Get.off(()=>const NavigationMenu()),
              );
              
              const loader=VerticalProductShimmer(itemCount: 6,);
              final widget=CloudhelperFunction.checkMultieRecordSate(snapshot: snapshot,loader: loader);
              if(widget !=null)return widget;
              final product=snapshot.data!;
              return
              GridViewLayout(itemCount: product.length, itemBuilder:(_,index)=>ProductCardVertical(product:product[index]) );} ),
        ),
        ),
      )
      
    );
  }
}