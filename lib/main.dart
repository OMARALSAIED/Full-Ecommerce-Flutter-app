import 'package:ecommerce/app.dart';
import 'package:ecommerce/data/repositories/auth/authentication_repositry.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';


void main() async {
  //Todo Add Widgets Binding
 final  widgetsFlutterBinding = WidgetsFlutterBinding.ensureInitialized();

  //Todo Add Init Local storage
  await GetStorage.init();
  //Todo Add Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsFlutterBinding);
  //Todo Add Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp vlaue) =>
    Get.put(AuthenticationRepositry())
  );

  //Todo Add Ininialze Authantication
  
  runApp(MyApp());
}
