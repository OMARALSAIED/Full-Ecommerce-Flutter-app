import 'package:ecommerce/common/wigets/custom_shapes/rounded_conatiner.dart';
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key, required this.selectedAddress});
  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark =THelperfunction.isDarkMode(context);
    return TRoundedContainer(
      padding: EdgeInsets.all(TSize.md),
            width: double.infinity,
            showborder: true,
            backgroundColor:selectedAddress ? AppColor.kPrimery.withOpacity(0.5) :AppColor.transparent ,
            borderColo: selectedAddress ? AppColor.transparent : dark ? AppColor.kDarkgrey : AppColor.kgrey,
            margin:const EdgeInsets.all(TSize.spaceBtweenItems),
            child: Stack(children: [
              Positioned(
                top: 0,
                right: 5,
                child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
                
                color: selectedAddress ? dark ? AppColor.kwhite.withOpacity(0.6) :  AppColor.kblack.withOpacity(0.6) : null),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("Omar Alsaied",
                
                maxLines: 2,
                overflow: TextOverflow.ellipsis
                ,
                style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: TSize.sm/2,),
                Text("(+964) 750 123 4567",maxLines: 1,overflow: TextOverflow.ellipsis,),
                 const SizedBox(height: TSize.sm/2,),
                  Text("85499 Dara nawa, sawtha, Erbil, syr, 98854,",
                   softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis
                ,
                style: Theme.of(context).textTheme.titleLarge),
              ],)
            ],),
          );
  }
}