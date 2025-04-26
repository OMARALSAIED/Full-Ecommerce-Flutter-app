import 'package:ecommerce/common/wigets/custom_shapes/rounded_conatiner.dart';
import 'package:ecommerce/features/shop/screens/product_review/widgets/ORatingBarIndicator.dart';
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/images_strings.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperfunction.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage(TImage.usericon)),
                const SizedBox(width: TSize.spaceBtweenItems),
                Text(
                  'Omar alSaied',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
        ),

        Row(
          children: [
            ORatingBarIndicator(rating: 3),
            const SizedBox(width: TSize.spaceBtweenItems),
            Text('01 Nov, 2023', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSize.spaceBtweenItems),
        ReadMoreText(
          trimLines: 2,
          trimExpandedText: ' Show less',
          trimCollapsedText: ' Show more',
          trimMode: TrimMode.Line,
          'The user interface of the app is designed to be clean, intuitive, and user-centric. From the moment users open the app, they are greeted with a modern layout that emphasizes ease of navigation and quick access to key features',
        ),
        const SizedBox(height: TSize.spaceBtweenItems),
        TRoundedContainer(
          backgroundColor: dark ? AppColor.kDarkgrey : AppColor.grey,
          child: Padding(
            padding: EdgeInsets.all(TSize.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "'T's Stor",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "02 Nov,2023",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                ReadMoreText(
                  trimLines: 2,
                  trimExpandedText: ' Show less',
                  trimCollapsedText: ' Show more',
                  trimMode: TrimMode.Line,
                  'The user interface of the app is designed to be clean, intuitive, and user-centric. From the moment users open the app, they are greeted with a modern layout that emphasizes ease of navigation and quick access to key features',
                ),
                const SizedBox(height: TSize.spaceBtweenItems),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
