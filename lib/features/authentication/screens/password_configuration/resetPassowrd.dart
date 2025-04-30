import 'package:ecommerce/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:ecommerce/features/authentication/screens/login/login.dart';
import 'package:ecommerce/util/constants/images_strings.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/constants/text_strings.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';


class Resetpassowrd extends StatelessWidget {
   Resetpassowrd({super.key,required  this.email});


  String email;

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(ForgetPasswordController());
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
          Text(email,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
          const SizedBox(height: TSize.spaceBtweenItems,),
            Text(TText.omarSupoort,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
             const SizedBox(height: TSize.spaceBtwSections,),
             SizedBox(width: double.infinity,child: ElevatedButton(onPressed: ()=>Get.offAll(()=>LoginScreen()), child: Text(TText.done)),),
             const SizedBox(height: TSize.spaceBtweenItems,),
             SizedBox(width: double.infinity,child:  TextButton(onPressed: ()=>controller.resendPasswordResetemail(email), child: Text(TText.Resendemail),),)
      ],
      ),));
    
  }
}