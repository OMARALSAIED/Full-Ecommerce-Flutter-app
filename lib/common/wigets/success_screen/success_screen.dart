import 'package:ecommerce/common/styles/spacing_style.dart';

import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


// ignore: must_be_immutable
class SuccessScreen extends StatelessWidget {
  SuccessScreen({super.key, required this.image, required this.title, required this.subtitle,required this.onPressed,  this.buttontitle=''});
  final String image,title,subtitle;
  final String buttontitle;
  
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: TSpacingStyle.paddingwidthAppBarHeight,
        child: Column(
          children: [
            Image(
              width: THelperfunction.screenWidth(context) * 6,
              image: AssetImage(image),
            ),
            const SizedBox(height: TSize.spaceBtwSections),
            Text(
            title,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: TSize.spaceBtweenItems),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: TSize.spaceBtwSections),
            SizedBox(width: double.infinity,child: ElevatedButton(onPressed: onPressed, child:Text(buttontitle)),)
          ],
        ),
      ),
    );
  }
}
