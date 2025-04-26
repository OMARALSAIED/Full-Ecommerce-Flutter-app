import 'package:ecommerce/common/wigets/success_screen/success_screen.dart';
import 'package:ecommerce/features/authentication/screens/login/login.dart';
import 'package:ecommerce/util/constants/images_strings.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/constants/text_strings.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class VeryifyEmail extends StatelessWidget {
  const VeryifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: ()=>Get.offAll(()=>LoginScreen()), icon: Icon(CupertinoIcons.clear))
      ],),
      body: Column(
      
           children: [
            
        Center(
          child: Image(
            width: THelperfunction.screenWidth(context)*0.6,
                
            image: AssetImage(TImage.VeryifyEmail)),
        ),
          const SizedBox(height: TSize.spaceBtwSections,),
          Text(TText.Verifyemail,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
          const SizedBox(height: TSize.spaceBtweenItems,),
            Text(TText.omarSupoort,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
             const SizedBox(height: TSize.spaceBtwSections,),
             SizedBox(width: double.infinity,child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 12),
               child: ElevatedButton(onPressed: (){Get.offAll(SuccessScreen(
                buttontitle: TText.loginNow,
                image: TImage.accepted,title:TText.verificationSuccess ,subtitle: TText.successsubtitle,onPressed: () {
                 Get.to(LoginScreen());
               },));}, child:const Text(TText.continueButton),),
             ),),
              const SizedBox(height: TSize.spaceBtwSections,),
              SizedBox(width: double.infinity,child: TextButton(onPressed: (){}, child:const Text(TText.Resendemail),),),
             const SizedBox(height: TSize.spaceBtwSections,),
           ],
           
      ),
    );
  }
}