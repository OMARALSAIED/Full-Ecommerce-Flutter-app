import 'package:ecommerce/common/wigets/app_bar/appbar.dart';
import 'package:ecommerce/common/wigets/images/TRoundedImage.dart';
import 'package:ecommerce/common/wigets/products/product_carts/product_card_horizntal.dart';
import 'package:ecommerce/common/wigets/text/sction_heading.dart';

import 'package:ecommerce/util/constants/images_strings.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:flutter/material.dart';


class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: TAppbar(title: Text('Sports'),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultspace),
          child: Column(children: [
            TRoundedImage(imageUrl:TImage.baner1 ,width:double.infinity,applyImageReduise: true,borderRadius:TSize.cardRadiusLg,),
            const SizedBox( height:  TSize.spaceBtwSections),
            Column(children: [TSectionHeading(title: 'Sport shrits'),
            
            const SizedBox( height:  TSize.spaceBtweenItems/2),
           SizedBox(
            height: 120,
             child: ListView.separated(
              itemCount: 12,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              separatorBuilder: (context, index) => const SizedBox(width: TSize.spaceBtweenItems,),
              itemBuilder:(context,Index){return TProdcutCardHorizntal();}),
           )
            
            
            ],)
          ],),
        ),
      ),
    );
  }
}