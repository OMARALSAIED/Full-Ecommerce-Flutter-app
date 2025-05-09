import 'package:ecommerce/common/wigets/text/sction_heading.dart';
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:flutter/material.dart';

class BillingAddressSecition extends StatelessWidget {
  const BillingAddressSecition({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
   
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
          title: 'Shipping Address',
          buttontitle: 'Change',
          onPressed: () {},
        ),
        const SizedBox(height: TSize.spaceBtweenItems/2),
        Text('Coding with Omar', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: TSize.spaceBtweenItems/2),

        Row(
          children: [
            const Icon(Icons.phone, color: AppColor.kgrey, size: 16),
            const SizedBox(width: TSize.spaceBtweenItems),
            Text(
              '+963-123-456-789',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.location_history, color: AppColor.kgrey, size: 16),
            const SizedBox(width: TSize.spaceBtweenItems),
            Text(
              'south syr, Maine 36485, SYR',
              style: Theme.of(context).textTheme.bodyMedium,
              softWrap: true,
            ),
          ],
        ),
      ],
    );
  }
}
