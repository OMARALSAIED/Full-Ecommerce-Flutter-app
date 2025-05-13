import 'package:ecommerce/common/wigets/Brands/Brand_card.dart';
import 'package:ecommerce/common/wigets/Shimmer/brands_shimmer.dart';
import 'package:ecommerce/common/wigets/app_bar/appbar.dart';
import 'package:ecommerce/common/wigets/app_bar/tabBar.dart';
import 'package:ecommerce/common/wigets/products/cart/cart_menu_icon.dart';
import 'package:ecommerce/common/wigets/custom_shapes/search_container.dart';
import 'package:ecommerce/common/wigets/layout/grid_layout.dart';
import 'package:ecommerce/common/wigets/text/sction_heading.dart';
import 'package:ecommerce/features/shop/controllers/category.controller.dart';
import 'package:ecommerce/features/shop/controllers/product/brand_controller.dart';
import 'package:ecommerce/features/shop/screens/Brands/all_brands.dart';
import 'package:ecommerce/features/shop/screens/Brands/brand_product.dart';
import 'package:ecommerce/features/shop/screens/store/widgets/CategoryTab.dart';
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:iconsax/iconsax.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final categories =CategoryController.insatnce.featuredCategories;
    final brandController=Get.put(BrandController());
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppbar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            SizedBox(height: 50),
            TcartCounterIcon(onPressed: () {}),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                automaticallyImplyLeading: false,
                backgroundColor: THelperfunction.isDarkMode(context)
                    ? AppColor.kblack
                    : AppColor.kLight,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSize.defaultspace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(height: TSize.spaceBtweenItems),
                      TSearchContainer(
                        text: 'Search in Store',
                        icon: Iconsax.search_normal,
                        showBorder: true,
                        showBackground: false,
                      ),
                      const SizedBox(height: TSize.spaceBtwSections),
                      TSectionHeading(
                        width: 140,
                        title: 'Featured Brands',
                        onPressed: () {Get.to(AllBrandsScreen());},
                        showActionButton: true,
                      ),
                      const SizedBox(height: TSize.spaceBtweenItems / 1.5),
                     Obx((){
                      if(brandController.isLoading.value)return BrandsShimmer();
                      if(brandController.featuredBrands.isEmpty)
                      {
                        return Center(child: Text('Not Found Data!',style: Theme.of(context).textTheme.bodyMedium!.apply(color: AppColor.kwhite),),);
                      }
                      return  GridViewLayout(
                        mainAxisExtent: 80,
                        itemCount: brandController.featuredBrands.length,
                        itemBuilder: (_, index) {
                          final brand=brandController.featuredBrands[index];
                          return  TBrandCard(showborder: true, brand: brand,onTap: ()=>Get.to(()=>BrandProduct(brand: brand,)),);
                        },
                      );
                     })
                    ],
                  ),
                ),
                bottom:  OTabbar(
                  tabs: 
                    // Tab(child: Text('Sports')),
                    // Tab(child: Text('Furniture')),
                    // Tab(child: Text('Electronics')),
                    // Tab(child: Text('Clothes')),
                    // Tab(child: Text('Cosmetics')),
                  
                     categories.map((category) => Tab(child: Text(category.Name))).toList(),


                 
                  
                ),
              ),
            ];
          },
          body: TabBarView(
            children:categories.map((category)=>CategoryTab(category: category,) ).toList()),
          ),
        ),
      );
    
  }
}


