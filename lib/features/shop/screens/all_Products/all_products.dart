import 'package:ecommerce/common/wigets/app_bar/appbar.dart';
import 'package:ecommerce/common/wigets/products/sortable/sortable_product.dart';

import 'package:ecommerce/util/constants/size.dart';
import 'package:flutter/material.dart';


class AllProducts extends StatelessWidget {
  const AllProducts({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppbar(title: Text('Popular Products',),showBackArrow: true,),
      body: Padding(padding: EdgeInsets.all(TSize.defaultspace),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultspace),
          child: SortableProduct(),
        ),
      ),
      ),
    );
  }
}
