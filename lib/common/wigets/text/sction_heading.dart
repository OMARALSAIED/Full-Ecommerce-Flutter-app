import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key, this.textcolor, required this.title,  this.onPressed,this.showActionButton=false,this.width,this.buttontitle="See All",
  });
  final Color? textcolor;
  final double? width;
  final bool showActionButton;
  final String title,buttontitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark =THelperfunction.isDarkMode(context);
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style:
        
         Theme.of(context).textTheme.headlineSmall!.apply(color: textcolor),maxLines: 1,overflow: TextOverflow.ellipsis,),
        
         SizedBox(width: width,),
       if(showActionButton) TextButton(onPressed: onPressed, child:  Text(buttontitle,style: TextStyle(color: dark? AppColor.kwhite :AppColor.kblack),)),
      ],
    );
  }
}

