import 'package:ecommerce/util/valdatores/auth_Exceptions.dart';
import 'package:ecommerce/util/valdatores/format_Exceptions.dart';
import 'package:ecommerce/util/valdatores/platform_Exceptioon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CloudhelperFunction {

  static Widget? checkSingleRecordSate<T>(AsyncSnapshot<T> snapshot)
  {
    if(snapshot.connectionState==ConnectionState.waiting)
    {return const Center(child: CircularProgressIndicator(),);}
    if(!snapshot.hasData || snapshot.data==null)
    {
      return const Center(child: Text("Something went wrong"),);
    }
    return null;
  }



  static Widget? checkMultieRecordSate<T>( {required AsyncSnapshot<List<T>>snapshot,Widget? loader ,Widget? error,Widget? nothingFound})
  {
    
    if (snapshot.hasData) {
  print("Data available: ${snapshot.data}");
}

    if(snapshot.connectionState==ConnectionState.waiting)
    {
      if(loader!=null)return loader;
      return const Center(child: CircularProgressIndicator(),);}

    if(!snapshot.hasData || snapshot.data==null||snapshot.data!.isEmpty)
    {
      if(nothingFound!=null)
      return const Center(child: Text("No Data Found!"),);
    }
    if(snapshot.hasError)
    {
      if(error!=null) return error;
      return const Center(child: Text('Something went wrong.'),);
    }

    return null;
  }


  static Future<String> getUrlFromFileAndName(String path)async
  {
     try{
      if(path.isEmpty)return '';
      final ref=FirebaseStorage.instance.ref().child(path);
      final url=ref.getDownloadURL();
      return url;
     }on FirebaseAuthException catch (e) {
      throw SthandelAuthExpetions(e.code).message;
    } on FirebaseException catch (e) {
      throw SthandelAuthExpetions(e.code).message;
    } on SthandelFormatExceptions catch (_) {
      throw SthandelFormatExceptions();
    } on SthandelPlatformExceptions catch (e) {
      throw SthandelPlatformExceptions(e.code).message;
    } catch (e) {
      'Faile to getUrlFromFileAndName';
    }
    return throw 'Somthing Went Wrong Whene tried to fetch Data ';
  }
  }
