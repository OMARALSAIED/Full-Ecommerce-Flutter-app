import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key, this.textcolor, required this.title,  this.onPressed,this.showActionButton=false
  });
  final Color? textcolor;
  final bool showActionButton;
  final String title,buttontitle="See All";
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark =THelperfunction.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.only(left: 10.0,),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style:
          
           Theme.of(context).textTheme.headlineSmall!.apply(color: textcolor),maxLines: 1,overflow: TextOverflow.ellipsis,),
          const SizedBox(width: 160,),
         if(showActionButton) TextButton(onPressed: onPressed, child:  Text(buttontitle,style: TextStyle(color: dark? AppColor.kwhite :AppColor.kblack),)),
        ],
      ),
    );
  }
}

