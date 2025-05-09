import 'package:ecommerce/common/wigets/app_bar/appbar.dart';
import 'package:ecommerce/common/wigets/icons/circularfav_icon.dart';
import 'package:ecommerce/common/wigets/layout/grid_layout.dart';
import 'package:ecommerce/common/wigets/products/product_carts/product_card_vertical.dart';
import 'package:ecommerce/features/shop/models/ProductModel.dart';

import 'package:ecommerce/util/constants/size.dart';

import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

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
        child: Column(children: [
          GridViewLayout(itemCount: 6, itemBuilder:(_,index)=>ProductCardVertical(product: ProductModel.empty()) )
        ],),
        ),
      )
      
    );
  }
}