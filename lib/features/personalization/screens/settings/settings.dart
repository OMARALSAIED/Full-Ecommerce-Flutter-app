import 'package:ecommerce/common/wigets/app_bar/appbar.dart';

import 'package:ecommerce/common/wigets/custom_shapes/primary_header_contianer.dart';
import 'package:ecommerce/common/wigets/list_tile/settings_menu_tile.dart';
import 'package:ecommerce/common/wigets/list_tile/user_profile.dart';
import 'package:ecommerce/common/wigets/text/sction_heading.dart';
import 'package:ecommerce/features/personalization/screens/Profile/porfile.dart';
import 'package:ecommerce/features/personalization/screens/address/address.dart';
import 'package:ecommerce/features/shop/screens/orders/orders.dart';
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/images_strings.dart';

import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelperfunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContianer(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: TSize.md),
                    child: TAppbar(
                      title: Text(
                        'Account',
                        style: Theme.of(context).textTheme.headlineMedium!
                            .apply(color: AppColor.kwhite),
                      ),
                    ),
                  ),
                  UserProfileCard(image: TImage.usericon,onPressed: () {Get.to(Porfile());} ,),
                  const SizedBox(height: TSize.xl),
                 
           ] ),
            ),
            const SizedBox(height: TSize.spaceBtwSections),
             Padding(
               padding: const EdgeInsets.all(TSize.defaultspace),
               child: Column(
                
                      children: [
                        TSectionHeading(
                          
                          title: 'Account Settings',
                          textcolor: dark ?AppColor.kwhite:AppColor.kblack,
                        ),
                        const SizedBox(height: TSize.spaceBtweenItems),
                        SettingsMenuTile(
                          onTap: () {
                            
                            Get.to(const AddressScreen());
                          },
                          icon: Iconsax.safe_home,
                          title: 'My Addresses',
                          subtitle: 'Set shopping delivery address',
                        ),
                         SettingsMenuTile(
                          icon: Iconsax.shopping_cart,
                          title: 'My Cart',
                          subtitle: 'Add, remove, or edit items',
                        ),
                         SettingsMenuTile(
                          onTap: () {
                            Get.to(const OredersScreen());
                          },
                          icon: Iconsax.bag_tick,
                          title: 'My Orders',
                          subtitle: 'In Progress, Delivered, Cancelled',
                        ),
                         SettingsMenuTile(
                          icon: Iconsax.bank,
                          title: 'Bank Account',
                          subtitle: 'withdraw balance, add bank account',
                        ),
                         SettingsMenuTile(
                          icon: Iconsax.discount_shape,
                          title: 'My Copons',
                          subtitle: 'List of all your copons',
                        ),
                         SettingsMenuTile(
                          icon: Iconsax.notification,
                          title: 'Notifications',
                          subtitle: 'Set notification preferences',
                        ),
                         SettingsMenuTile(
                          icon: Iconsax.security_card
                          ,
                          title: 'Account Privacy',
                          subtitle: 'Manage Data usage and privacy',
                        ),
                       const SizedBox(height: TSize.spaceBtwSections,),
                         TSectionHeading(
                          
                          title: 'App Settings',
                          textcolor: AppColor.kwhite,
                        ),
                          const SizedBox(height: TSize.spaceBtwSections,),
                           SettingsMenuTile(
                          icon: Iconsax.document_upload
                          ,
                          title: 'Load Data',
                          subtitle: 'Upload data to Your Cloud firebase'
                        ),
                          SettingsMenuTile(
                          icon: Iconsax.location
                          ,
                          title: 'Geolocation',
                          subtitle: 'Set recommendations based on location',
                          trailing: Switch(value: true, onChanged: (value){}),
                        ),
                          SettingsMenuTile(
                          icon: Iconsax.security_user
                          ,
                          title: 'Safe Mode',
                          subtitle: 'Search results is save for all ages',
                          trailing: Switch(value: true, onChanged: (value){}),
                        ),
                         SettingsMenuTile(
                          icon: Iconsax.image
                          ,
                          title: 'HD image Quality',
                          subtitle: 'Set image quality to be seen',
                          trailing: Switch(value: true, onChanged: (value){}),
                        ),
                        const SizedBox(height: TSize.spaceBtwSections,),
                        SizedBox(width: double.infinity,
                        child: OutlinedButton(onPressed: (){}, child: Text('Logout')),
                        ),
                         const SizedBox(height: TSize.spaceBtwSections*1.2,),
                      ],
                    ),
             ),
                ],
          
        ),
      ),
    );
  }
}
