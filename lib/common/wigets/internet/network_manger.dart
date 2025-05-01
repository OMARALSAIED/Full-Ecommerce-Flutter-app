import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkManager extends GetxController{
  static NetworkManager get instance=>Get.find();
  final Connectivity _connectivity = Connectivity();
 late final StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;


/// الحالة الحالية للاتصال
  final Rx<ConnectivityResult> _connectionStatus=ConnectivityResult.none.obs;

    @override
    void onInit()
    {
      super.onInit();
      // الاستماع للتغييرات
_connectivitySubscription = _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> results) async {
  if (results.isNotEmpty) {
    await _updateConnectionStatus(results.first);  // نأخذ أول نتيجة فقط
  }
});

    }



  /// تحدث حالة الاتصال وتخزنها داخليًا
 Future<void> _updateConnectionStatus(ConnectivityResult result) async {
  _connectionStatus.value=result;
 if(_connectionStatus.value ==ConnectivityResult.none)
 {
    'No InterNet Connection';
 }
}

Future<bool> isConnected()async{
    try{
      final result=await _connectivity.checkConnectivity();
      if(result==ConnectivityResult.none)
      {
        return false;
      }else{
        return true;
      }
    }on PlatformException catch(_)
    {
      return false;
    }
}


@override 
void onClose()
{
  super.onClose();
  _connectivitySubscription.cancel();
}

}
