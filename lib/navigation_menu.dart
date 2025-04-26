
import 'package:ecommerce/features/personalization/screens/settings/settings.dart';
import 'package:ecommerce/features/shop/screens/home/home.dart';
import 'package:ecommerce/features/shop/screens/store/store.dart';
import 'package:ecommerce/features/shop/screens/wishlist/wishlist.dart';
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  @override
  Widget build(BuildContext context) {
    final  controller = Get.put(Navigationcontroller());
    final dark=THelperfunction.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(()=>
        NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected:(index)=>controller.selectedIndex.value=index ,
          backgroundColor: dark ? AppColor.kblack : AppColor.kwhite,
          indicatorColor: dark? AppColor.kwhite.withOpacity(0.1) : AppColor.kblack.withOpacity(0.1),
          destinations: [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
          
        ),
      ),

      body:Obx(()=> controller.screens[controller.selectedIndex.value])
    );
  }
}

class Navigationcontroller extends GetxController
{
   final Rx<int> selectedIndex=0.obs;

   final screens=[HomeScreen(),StoreScreen(),FavouriteScreen(),SettingsScreen(),];
}
