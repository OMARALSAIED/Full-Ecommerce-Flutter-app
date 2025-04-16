import 'package:ecommerce/common/wigets/app_bar/appbar.dart';
import 'package:ecommerce/common/wigets/cart_menu_container/cart_menu_Counter.dart';
import 'package:ecommerce/common/wigets/custom_shapes/rounded_conatiner.dart';
import 'package:ecommerce/common/wigets/custom_shapes/search_container.dart';
import 'package:ecommerce/common/wigets/images/TRoundedImage.dart';
import 'package:ecommerce/common/wigets/layout/grid_layout.dart';
import 'package:ecommerce/common/wigets/text/brandTitleWithVerifiedIcon.dart'; // updated import path if needed
import 'package:ecommerce/common/wigets/text/sction_heading.dart';
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/images_strings.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppbar(
        title: Text(
          'Store',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          SizedBox(height: 50),
          TcartCounterIcon(onPressed: () {})
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
                padding: EdgeInsets.all(TSize.defaultspace),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    SizedBox(height: TSize.spaceBtweenItems),
                    TSearchContainer(
                      text: 'Search in Store',
                      icon: Iconsax.search_normal,
                      showBorder: true,
                      showBackground: false,
                    ),
                    SizedBox(height: TSize.spaceBtwSections),
                    TSectionHeading(
                      title: 'Featured Brands',
                      onPressed: () {},
                      showActionButton: true,
                    ),
                    SizedBox(height: TSize.spaceBtweenItems / 1.5),
                    GridViewLayout(
                      mainAxisExtent: 80,
                      itemCount: 4, itemBuilder: (_,index){
                      return   GestureDetector(
                        onTap: (){},
                        child: TRoundedContainer(
                        padding: const EdgeInsets.all(TSize.sm),
                        showborder: true,
                        backgroundColor: AppColor.transparent,
                        child: Row(
                          children: [
                            Flexible(
                              child: TRoundedImage(
                                height: 56,
                                width: 56,
                                isNetworkimage: false,
                                imageUrl: TImage.nikelogo1,
                                backgroundColor: AppColor.transparent,
                                OverlayColor:
                                    THelperfunction.isDarkMode(context)
                                        ? AppColor.kwhite
                                        : AppColor.kblack,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                               mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                 Row(children: [
                                  Text('Nike',style: TextStyle(fontSize: TSize.md),),
                                  SizedBox(width: TSize.sm,),
                                  Icon(Iconsax.verify5,color: AppColor.kPrimery,size: TSize.md,),
                                
                                 ],),
                                   Text('256 productes',
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.labelMedium,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                                            ),
                      );

                    })
                  
                  ],
                ),
              ),
            )
          ];
        },
        body: Container(),
      ),
    );
  }
}
