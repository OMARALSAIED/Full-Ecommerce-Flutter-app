import 'package:ecommerce/common/wigets/custom_shapes/circula_image_container.dart';
import 'package:ecommerce/util/constants/AppColors.dart';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UserProfileCard extends StatelessWidget {
   UserProfileCard({
    required this.onPressed,
    required this.image,
    super.key,
  });
  final String image;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      
      leading: TCircleImageContainer(image: AssetImage(image),width: 60,height: 60,),
      title: Text('Omar Alsaied',style: Theme.of(context).textTheme.headlineSmall!.apply(color: AppColor.kwhite,)),
      subtitle: Text('Omar.Alsaied.ahmad@gmail.com',style: Theme.of(context).textTheme.bodyMedium!.apply(color: AppColor.kwhite,)),
      trailing: IconButton(onPressed: onPressed, icon: Icon(Iconsax.edit, color: AppColor.kwhite,)),
      );
  }
}