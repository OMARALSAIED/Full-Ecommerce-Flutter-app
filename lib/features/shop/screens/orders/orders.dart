import 'package:ecommerce/common/wigets/app_bar/appbar.dart';
import 'package:ecommerce/features/shop/screens/orders/widgets/orders_List_Items.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:flutter/material.dart';

class OredersScreen extends StatelessWidget {
  const OredersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppbar(title: Text('My Orders',style: Theme.of(context).textTheme.headlineSmall,),showBackArrow: true,),
      body: Padding(padding: EdgeInsets.all(TSize.defaultspace),child: OrdersListItems(),),
      );
  }
}