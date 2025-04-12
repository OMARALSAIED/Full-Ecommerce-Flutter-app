import 'package:ecommerce/features/authentication/screens/onborading/onborading.dart';
import 'package:ecommerce/util/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme:TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home:OnboradingScreen(),
    );
    
}
}