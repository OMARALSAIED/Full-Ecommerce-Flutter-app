import 'package:ecommerce/common/wigets/Brands/Brand_card.dart';
import 'package:ecommerce/common/wigets/app_bar/appbar.dart';
import 'package:ecommerce/common/wigets/layout/grid_layout.dart';

import 'package:ecommerce/common/wigets/text/sction_heading.dart';
import 'package:ecommerce/features/shop/screens/Brands/brand_product.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: TAppbar(title: Text('Brand'),showBackArrow: true,),
    body: SingleChildScrollView(child: Padding(padding: EdgeInsets.all(TSize.defaultspace),child:Column(children: [
      TSectionHeading(title: 'Brands',showActionButton: true,),
      const SizedBox(height: TSize.spaceBtweenItems,),
      GridViewLayout(
      
        mainAxisExtent: 80,
        itemCount: 10, itemBuilder: (context,index){
        return TBrandCard(showborder: true,onTap: (){Get.to(BrandProduct());},);
      },
      
      ),

    ],) ,),),
    
    
    );
  }
}