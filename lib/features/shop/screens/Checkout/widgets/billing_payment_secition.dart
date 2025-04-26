import 'package:ecommerce/common/wigets/custom_shapes/rounded_conatiner.dart';
import 'package:ecommerce/common/wigets/text/sction_heading.dart';
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/images_strings.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class BillingAmounttSecition extends StatelessWidget {
  const BillingAmounttSecition({super.key});
  

  @override
  Widget build(BuildContext context) {
    final dark =THelperfunction.isDarkMode(context);
    return 
    Column(children: [
         TSectionHeading(title: 'PayMent Method',buttontitle: 'Change',showActionButton: true,width: 130,onPressed: (){},),
         const SizedBox(height: TSize.spaceBtweenItems/2,),
         Row(children: [
          TRoundedContainer(
            width: 60,
            height: 35,
            backgroundColor: dark ?AppColor.kDark :AppColor.kwhite,
            padding: EdgeInsets.all(TSize.sm),
            child: const Image(image: AssetImage(TImage.paypal,),fit: BoxFit.contain,),
          ),
          const SizedBox(width: TSize.spaceBtweenItems,),
          Text('PayPal',style: Theme.of(context).textTheme.bodyLarge,),
         ],)
    ],);
  }
}