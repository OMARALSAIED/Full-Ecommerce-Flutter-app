import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/images_strings.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:flutter/material.dart';

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
        decoration: BoxDecoration(border: Border.all(color: AppColor.grey),borderRadius: BorderRadius.circular(1000)),
          child: IconButton(onPressed: (){}, icon: Image(
               width: TSize.iconlg,
          height: TSize.iconlg,
            
            image: AssetImage(TImage.google)
          
          )),
        ),
        const SizedBox(width: TSize.spaceBtweenItems,),
             Container(
       decoration: BoxDecoration(border: Border.all(color:AppColor.grey),borderRadius: BorderRadius.circular(100)),
          child: IconButton(onPressed: (){}, icon: Image(
               width: TSize.iconmd,
          height: TSize.iconmd,
            
            image: AssetImage(TImage.facbook)
          
          )),
        )
              
      ],
    );
  }
}