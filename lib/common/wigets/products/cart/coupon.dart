
import 'package:ecommerce/common/wigets/custom_shapes/rounded_conatiner.dart';

import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class couponCode extends StatelessWidget {
  const couponCode({
    super.key,
 
  });

  

  @override
  Widget build(BuildContext context) {
    final dark=THelperfunction.isDarkMode(context);
    return TRoundedContainer(
     showborder: true,
     backgroundColor: dark ? AppColor.kblack : AppColor.kwhite,
     padding: EdgeInsets.only(top: TSize.sm,bottom:  TSize.sm,right:  TSize.sm,left:  TSize.md), 
     child: Row(children: [
      Flexible(
        child: TextFormField(
          decoration:InputDecoration(
            hintText: 'Have a promo code? Enter it here',
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          )
        ),
      ),
      SizedBox
    
      (
          width: 80,
        child: ElevatedButton(onPressed: (){},
        style: ElevatedButton.styleFrom(
          foregroundColor: dark ?AppColor.kwhite.withOpacity(0.5) : AppColor.kblack.withOpacity(0.5),
          backgroundColor: AppColor.grey.withOpacity(0.1),
          side: BorderSide(color: AppColor.grey.withOpacity(0.1))
        ),
         child: Text('Apply',
        )))
     ],),
    );
  }
}