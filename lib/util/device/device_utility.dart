import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TDeviceUitles
{
  static void hidkeyborad(BuildContext context)
  {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Future<void> setStatuseBarColor(Color color)async
  {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: color));
  }

  static bool isLandscapeOrientation(BuildContext context)
  {
    final viewInses=View.of(context).viewInsets;
    return viewInses.bottom==0;
  }

  static bool isPortraitOrientation(BuildContext context)
  {
    final viewInses=View.of(context).viewInsets;
    return viewInses.bottom !=0;
  }

  static void setFullScreen(bool enable)
  {
    SystemChrome.setEnabledSystemUIMode(enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }
  static double getScreenheight()
  {
    return MediaQuery.of(Get.context!).size.height;
  }

   static double getScreenwidth()
  {
    return MediaQuery.of(Get.context!).size.width;
  }

  static double getPixRatio()
  {
    return MediaQuery.of(Get.context!).devicePixelRatio;
  }


  static double getStatuseBarHeight()
  {
    return MediaQuery.of(Get.context!).padding.top;
  }

  static double getBottomNavigationBarHeight()
  {
    return kBottomNavigationBarHeight;
  }

  static double getAppBarHeight()
  {
    return kToolbarHeight;
  }
  static double getKeyBoradHeight()
  {
    final viewInsets=MediaQuery.of(Get.context!).viewInsets;
    return viewInsets.bottom;
  }
  static Future<bool>isKeyboradVisibal()async{
    final viewInsets=View.of(Get.context!).viewInsets;
    return viewInsets.bottom>0;
  }

  static Future<bool> isPhysicalDeive()async
  {
    return defaultTargetPlatform==TargetPlatform.android || defaultTargetPlatform==TargetPlatform.iOS;
  }

  static void vibrate(Duration duration)
  {
    HapticFeedback.vibrate();
    Future.delayed(duration ,()=> HapticFeedback.vibrate());
  }

  static Future<void> setPreferredientations(List<DeviceOrientation> orientation)async
  {
    await SystemChrome.setPreferredOrientations(orientation);
  }

  static void hidesatusbar()
  {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: []);
  }
  static Future<bool> hasInterentAddress()async
  {
    try{
      final result=await InternetAddress.lookup('example');
      return result.isEmpty && result[0].rawAddress.isNotEmpty;


    } on SocketException catch(_)
    {
       return false;
    }
  }

  static bool isIos()
  {
    return Platform.isIOS;
  }
  static bool isAndroid()
  {
    return Platform.isAndroid;
  }

  static void LancherUrl(String url)async
  {
    if(await canLaunchUrlString(url))
    {
      await launchUrlString(url);
    }else{
      throw 'Could not Launch $url';
    }
  }






}



