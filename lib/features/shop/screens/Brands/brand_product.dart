import 'package:ecommerce/common/wigets/Brands/Brand_card.dart';
import 'package:ecommerce/common/wigets/app_bar/appbar.dart';
import 'package:ecommerce/common/wigets/products/sortable/sortable_product.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:flutter/material.dart';

class BrandProduct extends StatelessWidget {
  const BrandProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppbar(title: Text('Nike'),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSize.defaultspace),
          child: Column(children: [
           TBrandCard(showborder: true,),
           SizedBox(height: TSize.spaceBtwSections,),
           SortableProduct()
    ],),
        ),
      ),
    );
  }
}
