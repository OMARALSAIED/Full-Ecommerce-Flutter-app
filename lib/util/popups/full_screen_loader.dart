import 'package:ecommerce/common/wigets/Animation/animation.dart';
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class FullScreenLoader {

  static void openLoadingDiloG(String text,String animation)
  {
    showDialog(
      context: Get.overlayContext!,
    barrierDismissible: false,
     builder: (_)=>PopScope(
      canPop: false,
      child:Container(
       
        width: double.infinity,
        height: double.infinity,
        child: Column(children: [
          const SizedBox(
            height: 250,
          ),
          AnimationLoaderWidget(text: text,animation: animation,)
        ],),
      )
     
     ));
  }

  static stopLoading()
{
   
  
    Navigator.of(Get.overlayContext!).pop();
  
}

}



