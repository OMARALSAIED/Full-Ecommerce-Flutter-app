import 'package:ecommerce/common/wigets/Brands/Brand_card.dart';
import 'package:ecommerce/common/wigets/Shimmer/vertical_product_shimmer.dart';
import 'package:ecommerce/common/wigets/app_bar/appbar.dart';
import 'package:ecommerce/common/wigets/products/sortable/sortable_product.dart';
import 'package:ecommerce/features/shop/controllers/product/brand_controller.dart';
import 'package:ecommerce/features/shop/models/BrandModel.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/helpers/cloudHelper_function.dart';
import 'package:flutter/material.dart';


class BrandProduct extends StatelessWidget {
  const BrandProduct({super.key,required this.brand});
final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller=BrandController.instance;
    return Scaffold(
      appBar: TAppbar(title: Text(brand.Name),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSize.defaultspace),
          child: Column(children: [
           TBrandCard(showborder: true,brand: brand),
           SizedBox(height: TSize.spaceBtwSections,),
           FutureBuilder(
            future: controller.getBrandForproduct(brandId: brand.Id),
            builder: (context,snapshot){

              const loader=VerticalProductShimmer();
              final widget=CloudhelperFunction.checkMultieRecordSate(snapshot:snapshot ,loader: loader);
              if(widget!=null) return widget;
               final brandProduct=snapshot.data!;
              return  SortableProduct(product:brandProduct,);
            },)
    ],),
        ),
      ),
    );
  }
}
