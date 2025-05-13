import 'package:ecommerce/common/wigets/Brands/Brand_card.dart';
import 'package:ecommerce/common/wigets/Shimmer/brands_shimmer.dart';
import 'package:ecommerce/common/wigets/app_bar/appbar.dart';
import 'package:ecommerce/common/wigets/layout/grid_layout.dart';
import 'package:ecommerce/common/wigets/text/sction_heading.dart';
import 'package:ecommerce/features/shop/controllers/product/brand_controller.dart';
import 'package:ecommerce/features/shop/models/BrandModel.dart';
import 'package:ecommerce/features/shop/screens/Brands/brand_product.dart';
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key,});


  @override
  Widget build(BuildContext context) {
    final brandController =BrandController.instance
    ;
    return Scaffold(appBar: TAppbar(title: Text('Brand'),showBackArrow: true,),
    body: SingleChildScrollView(child: Padding(padding: EdgeInsets.all(TSize.defaultspace),child:Column(children: [
      TSectionHeading(title: 'Brands'),
      const SizedBox(height: TSize.spaceBtweenItems,),
       Obx((){
                      if(brandController.isLoading.value)return BrandsShimmer();
                      if(brandController.allBrands.isEmpty)
                      {
                        return Center(child: Text('Not Found Data!',style: Theme.of(context).textTheme.bodyMedium!.apply(color: AppColor.kwhite),),);
                      }
                      return  GridViewLayout(
                        mainAxisExtent: 80,
                        itemCount: brandController.allBrands.length,
                        itemBuilder: (_, index) {
                          final brand=brandController.allBrands[index];
                          return  TBrandCard(showborder: true, brand: brand,onTap:()=> Get.to(()=> BrandProduct(brand: brand,)));
                        },
                      );
                     })

    ],) ,),),
    
    
    );
  }
}