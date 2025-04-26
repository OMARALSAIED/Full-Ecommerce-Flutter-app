import 'package:ecommerce/common/wigets/custom_shapes/rounded_conatiner.dart';
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OrdersListItems extends StatelessWidget {
  const OrdersListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperfunction.isDarkMode(context);
    return ListView.separated(
      itemCount: 12,
      separatorBuilder: (_,__)=> SizedBox(height: TSize.spaceBtweenItems,),
      itemBuilder:(_,index)=> TRoundedContainer(
        padding: EdgeInsets.all(TSize.md),
        backgroundColor: dark ? AppColor.kblack : AppColor.kwhite,
        showborder: true,
        child: Column(
        mainAxisSize: MainAxisSize.min,
          children: [
            Row(
            
              children: [
                Icon(Iconsax.ship),
                const SizedBox(width: TSize.spaceBtweenItems / 2),
                Column(
                  
                  children: [
                    Text(
                      'Prossesing',
                      style: Theme.of(context).textTheme.bodyLarge!.apply(
                        color: AppColor.kPrimery,
                        fontWeightDelta: 1,
                      ),
                    ),
                    Text(
                      '24 Nov 2024',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
                Spacer(),
                IconButton(onPressed: (){}, icon: const Icon(Iconsax.arrow_right_34,size: TSize.iconsm,))
              ],
            ),
            const SizedBox(height: TSize.spaceBtwSections,),
              Row(
            
              children: [
                Icon(Iconsax.tag),
                const SizedBox(width: TSize.spaceBtweenItems / 2),
                Column(
                  
                  children: [
                    Text(
                      'Order',
                      style: Theme.of(context).textTheme.labelMedium
                    ),
                    Text(
                      '[#25445]',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                Spacer(),
                 Icon(Icons.date_range_sharp),
                const SizedBox(width: TSize.spaceBtweenItems / 2),
                Column(
                  
                  children: [
                    Text(
                      'Shpping Date',
                      style: Theme.of(context).textTheme.labelMedium
                    ),
                    Text(
                      '03 Feb 2025',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ), 
    );
  }
}
