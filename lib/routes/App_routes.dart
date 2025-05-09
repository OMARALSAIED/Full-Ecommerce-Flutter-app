
import 'package:ecommerce/features/personalization/screens/address/address.dart';
import 'package:ecommerce/features/personalization/screens/settings/settings.dart';
import 'package:ecommerce/features/shop/screens/cart/CartScreen.dart';
import 'package:ecommerce/features/shop/screens/orders/orders.dart';
import 'package:ecommerce/features/shop/screens/wishlist/wishlist.dart';

import 'package:ecommerce/routes/routes_string.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';



abstract class AppRouter
{


  static final pages=[  
    GetPage(name: SRouets.orders,page: () => const OredersScreen(),),
    GetPage(name: SRouets.wishlist,page: () => const FavouriteScreen(),),
   GetPage(name: SRouets.address,page: () => const AddressScreen(),),
    GetPage(name: SRouets.settings,page: () => const SettingsScreen(),),
    GetPage(name: SRouets.CartScreen,page: () => const Cartscreen(),),];
}