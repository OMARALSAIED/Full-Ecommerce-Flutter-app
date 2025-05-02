import 'dart:ffi';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/utils.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseStorgeService extends GetxController {
  static FirebaseStorgeService get instance => Get.find();

  final _firebaseStroge=FirebaseStorage.instance;


  Future<Uint8List> getImageDataFromAssets(String  path)async
  {
    try{
      final byteData=await rootBundle.load(path);
      final imageData=byteData.buffer.asUint8List(byteData.offsetInBytes,byteData.lengthInBytes);
      return imageData;
    }catch(e)
    {
      throw 'Error loading image data: $e';
    }
  }

  Future<String> uploadImageData(String path,Uint8List image,String name)async
  {
      try{
        final ref=_firebaseStroge.ref(path).child(name);
        await ref.putData(image);
        final url=await ref.getDownloadURL();
        return url;

      }catch(e)
      {
        if(e is FirebaseException)
        {
          throw 'Firebase Exception: ${e.message}';
        }else if(e is SocketException)
         {
          throw 'Network error: ${e.message}';
         }else if(e is PlatformException)
         {
          throw 'PlatForm Exception: ${e.message}';
         }else{
          throw 'Somthing went Wrong! Please try again';
         }
      }
  }
  Future<String> uploadImageFile(String path,XFile image)async
  {
      try{
        final ref=_firebaseStroge.ref(path).child(image.name);
        await ref.putFile(File(image.path));
        final url=await ref.getDownloadURL();
        return url;

      }catch(e)
      {
        if(e is FirebaseException)
        {
          throw 'Firebase Exception: ${e.message}';
        }else if(e is SocketException)
         {
          throw 'Network error: ${e.message}';
         }else if(e is PlatformException)
         {
          throw 'PlatForm Exception: ${e.message}';
         }else{
          throw 'Somthing went Wrong! Please try again';
         }
      }
  }
}