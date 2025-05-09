import 'package:ecommerce/bindings/general_bindings.dart';
import 'package:ecommerce/features/authentication/screens/onborading/onborading.dart';
import 'package:ecommerce/routes/App_routes.dart';
import 'package:ecommerce/util/theme/controller/theme_controller.dart';
import 'package:ecommerce/util/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class MyApp extends StatelessWidget {
   MyApp({super.key});
 final ThemeController themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
      theme:TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      getPages: AppRouter.pages,
      initialBinding: GeneralBindings(),
      home:OnboradingScreen(),
    );
    
}
}