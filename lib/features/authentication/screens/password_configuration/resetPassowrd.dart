import 'package:ecommerce/util/constants/images_strings.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/constants/text_strings.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';


class Resetpassowrd extends StatelessWidget {
  const Resetpassowrd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: ()=>Get.back(), icon: Icon(CupertinoIcons.clear)),
      ],),
      body: Padding(padding: EdgeInsets.all(TSize.defaultspace),child: Column(
        children: [
           Center(
             child: Image(
              width: THelperfunction.screenWidth(context)*0.6,
                  
              image: AssetImage(TImage.VeryifyEmail)),
           ),
        
          const SizedBox(height: TSize.spaceBtwSections,),
          Text(TText.passwordResetEmailsent,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
          const SizedBox(height: TSize.spaceBtweenItems,),
            Text(TText.omarSupoort,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
             const SizedBox(height: TSize.spaceBtwSections,),
             SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){}, child: Text(TText.done)),),
             const SizedBox(height: TSize.spaceBtweenItems,),
             SizedBox(width: double.infinity,child:  TextButton(onPressed: (){}, child: Text(TText.Resendemail),),)
      ],
      ),));
    
  }
}