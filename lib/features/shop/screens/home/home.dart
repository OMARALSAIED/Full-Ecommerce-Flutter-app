import 'package:ecommerce/common/wigets/TverticalImageTextCategories/TverticalImageTextCategories.dart';
import 'package:ecommerce/common/wigets/custom_shapes/primary_header_contianer.dart';
import 'package:ecommerce/common/wigets/custom_shapes/search_container.dart';
import 'package:ecommerce/common/wigets/text/sction_heading.dart';
import 'package:ecommerce/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/images_strings.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContianer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeAppbar(),
                  const SizedBox(height: TSize.spaceBtwSections),

                  TSearchContainer(
                    icon: Iconsax.search_normal,
                    text: "Search in Store",
                    showBorder: true,
                    showBackground: true,
                  ),

                  const SizedBox(height: TSize.spaceBtwSections),

                  Padding(
                    padding: const EdgeInsets.only(left: TSize.defaultspace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TSectionHeading(
                          title: "Popular Categories", // ✅ Fixed typo here
                          textcolor: Colors.white,
                          onPressed: () {},
                          showActionButton: true,
                        ),

                        SizedBox(
                          height: 80,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 10,
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.only(
                              right: TSize.spaceBtweenItems,
                            ),
                            itemBuilder: (_, index) {
                              return TverticalImageTextCategories(image: TImage.shose,title: 'Shose Categores',textcolor: AppColor.kwhite,onTap: (){},);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

