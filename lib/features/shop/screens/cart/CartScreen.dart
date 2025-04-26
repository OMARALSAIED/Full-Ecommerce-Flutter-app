import 'package:ecommerce/common/wigets/app_bar/appbar.dart';
import 'package:ecommerce/common/wigets/products/cart/ProductQuantityWithAddAndRemove.dart';
import 'package:ecommerce/common/wigets/products/cart/card_item.dart';
import 'package:ecommerce/common/wigets/text/product_price_text.dart';
import 'package:ecommerce/features/shop/screens/Checkout/checkout.dart';
import 'package:ecommerce/features/shop/screens/cart/widgets/card_items_list.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';




class Cartscreen extends StatelessWidget {
  const Cartscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppbar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSize.defaultspace),
        child: CarditemsList(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSize.defaultspace),
        child: ElevatedButton(onPressed: (){Get.to(Checkout());}, child:Text('Checkout \$265.3')),
      ),
    );
  }
}

