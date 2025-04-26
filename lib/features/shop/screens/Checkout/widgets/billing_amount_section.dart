import 'package:ecommerce/util/constants/size.dart';
import 'package:flutter/material.dart';

class BillingPaymentSecition extends StatelessWidget {
  const BillingPaymentSecition({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         Text('Subtotal',style: Theme.of(context).textTheme.bodyMedium,),
          Text('\$256.3',style: Theme.of(context).textTheme.bodyMedium,),

      ],),
      const SizedBox(height:TSize.spaceBtweenItems/2,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Shpping Fee',style: Theme.of(context).textTheme.bodyMedium,),
          Text('\$6.5',style: Theme.of(context).textTheme.labelLarge,),
      ],),
       Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Tax Fee',style: Theme.of(context).textTheme.bodyMedium,),
          Text('\$6.0',style: Theme.of(context).textTheme.labelLarge,),
      ],),
       Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Order Total',style: Theme.of(context).textTheme.bodyMedium,),
          Text('\$500.10',style: Theme.of(context).textTheme.titleMedium,),
      ],)
    ],);
}}