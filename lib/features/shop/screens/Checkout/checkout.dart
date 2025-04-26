import 'package:ecommerce/common/wigets/app_bar/appbar.dart';
import 'package:ecommerce/common/wigets/custom_shapes/rounded_conatiner.dart';
import 'package:ecommerce/common/wigets/products/cart/coupon.dart';
import 'package:ecommerce/common/wigets/success_screen/success_screen.dart';
import 'package:ecommerce/features/shop/screens/Checkout/widgets/billing_address_secition.dart';
import 'package:ecommerce/features/shop/screens/Checkout/widgets/billing_amount_section.dart';
import 'package:ecommerce/features/shop/screens/Checkout/widgets/billing_payment_secition.dart';

import 'package:ecommerce/features/shop/screens/cart/widgets/card_items_list.dart';
import 'package:ecommerce/navigation_menu.dart';
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/images_strings.dart';

import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/constants/text_strings.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';


class Checkout extends StatelessWidget {
  const Checkout({super.key});
  
       

  @override
  Widget build(BuildContext context) {
    final  dark=THelperfunction.isDarkMode(context);
    return Scaffold(
      appBar: TAppbar(showBackArrow: true,title: Text('Order Review' ,style: Theme.of(context).textTheme.headlineSmall,),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultspace),
          child: Column(children: [
            CarditemsList(showAddRemoveButtons: false,),
            const SizedBox(height: TSize.spaceBtwSections,),
            couponCode(),
                
            const SizedBox(height: TSize.spaceBtwSections,),
            TRoundedContainer(
              padding: EdgeInsets.all(TSize.md),
              showborder: true,
            backgroundColor: dark ?AppColor.kblack : AppColor.kwhite,
            child: Column(children: [
              BillingPaymentSecition(),
              const SizedBox(height: TSize.spaceBtweenItems,),
              Divider()
              ,
               const SizedBox(height: TSize.spaceBtweenItems,),
               BillingAmounttSecition(),
               const SizedBox(height: TSize.spaceBtweenItems,),
               BillingAddressSecition(),
            ],),
            )
          
          ],),
        ),
      ),
        bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSize.defaultspace),
        child: ElevatedButton(onPressed: (){Get.to(SuccessScreen(image: TImage.accepted, title: 'Payment Success!', subtitle: 'Your item will be shipped', onPressed:(){Get.to(NavigationMenu());},buttontitle: TText.continueButton,));}, child:Text('Checkout \$265.3')),
      ),
      );
  }
}

