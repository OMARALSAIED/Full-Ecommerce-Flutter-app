import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/common/wigets/Shimmer/vertical_product_shimmer.dart';
import 'package:ecommerce/common/wigets/app_bar/appbar.dart';
import 'package:ecommerce/common/wigets/products/sortable/sortable_product.dart';
import 'package:ecommerce/features/shop/controllers/product/all_products_controller.dart';
import 'package:ecommerce/features/shop/models/ProductModel.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/helpers/cloudHelper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';



class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.title, this.query,this.futuerMethod});

final   String title;
final Query? query;
final Future<List<ProductModel>>? futuerMethod;


  @override
  Widget build(BuildContext context) {
    final controller=Get.put(AllProductsController());
    
    return Scaffold(
      appBar: TAppbar(title: Text(title,),showBackArrow: true,),
      body: Padding(padding: EdgeInsets.all(TSize.defaultspace),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultspace),
          child: FutureBuilder(future: futuerMethod ?? controller.fetchProductsByQuery(query), builder:(context,snapshot){
            const loader= VerticalProductShimmer();
            final widget=CloudhelperFunction.checkMultieRecordSate(snapshot:snapshot ,loader: loader);
            if(widget!=null)return widget;
            final products=snapshot.data;
            return SortableProduct(product: products!,);
          })
        ),
      ),
      ),
    );
  }
}
