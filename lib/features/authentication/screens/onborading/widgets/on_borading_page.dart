
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class OnBoradingPage extends StatelessWidget {
  const OnBoradingPage({
    
    super.key, required this.image, required this.title, required this.subtitle,
  });

  final String title,subtitle,image;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSize.defaultspace),
      child: Column(
        children: [
           
           Image(
            width: THelperfunction.screenWidth(context) * 0.8,
            height: THelperfunction.screenHeight(context) * 0.7,
            image: AssetImage(image)),
            Text(title,style:Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
            const SizedBox(height: TSize.spaceBtweenItems,),
            Text(subtitle,style:Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}