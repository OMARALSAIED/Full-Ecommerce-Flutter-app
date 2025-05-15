import 'package:ecommerce/common/wigets/Brands/brand_show_case.dart';
import 'package:ecommerce/common/wigets/Shimmer/BoxShimmer.dart';
import 'package:ecommerce/common/wigets/Shimmer/listTile_shimmer.dart';
import 'package:ecommerce/features/shop/controllers/product/brand_controller.dart';
import 'package:ecommerce/features/shop/models/category_model.dart';


import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/helpers/cloudHelper_function.dart';

import 'package:flutter/material.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.catgeory});

  final CategoryModel catgeory;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future: controller.getBrandforCategory(catgeory.id),
      builder: (context, snapshot) {
        const loader = Column(
          children: [
            ListtileShimmer(),
            SizedBox(height: TSize.spaceBtweenItems),
            Boxshimmer(),
            SizedBox(height: TSize.spaceBtweenItems),
          ],
        );
        final widget = CloudhelperFunction.checkMultieRecordSate(
          snapshot: snapshot,
          loader: loader,
        );
        if (widget != null) return widget;
        final brands = snapshot.data!;
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: brands.length,
          itemBuilder: (_, index) {
            final brand = brands[index];
            return FutureBuilder(
              future: controller.getBrandForproduct(brandId: brand.Id,limit: 3),
              builder: (context, snapshot) {
                final widget=CloudhelperFunction.checkMultieRecordSate(snapshot: snapshot,loader: loader);
                if(widget!=null)return widget;
                final product=snapshot.data!;
                return
              BrandShowCase(
                images:product.map((e)=>e.thumbnail).toList(),
                brand: brand,
                  );}
            );
          },
        );
      },
    );
  }
}
