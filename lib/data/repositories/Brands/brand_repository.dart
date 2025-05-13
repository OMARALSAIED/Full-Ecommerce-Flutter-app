import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/shop/models/BrandModel.dart';
import 'package:ecommerce/util/valdatores/auth_Exceptions.dart';
import 'package:ecommerce/util/valdatores/format_Exceptions.dart';
import 'package:ecommerce/util/valdatores/platform_Exceptioon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance=>Get.find();

  final _db=FirebaseFirestore.instance;

  Future<List<BrandModel>> getAllBrands()async
  {
    try{
        final snapshot=await _db.collection('Brands').get();
        final result=snapshot.docs.map((e)=> BrandModel.fromSnapshot(e)).toList();
        return result;
    }on FirebaseAuthException catch (e) {
      throw SthandelAuthExpetions(e.code).message;
    } on FirebaseException catch (e) {
      throw SthandelAuthExpetions(e.code).message;
    } on SthandelFormatExceptions catch (_) {
      throw SthandelFormatExceptions();
    } on SthandelPlatformExceptions catch (e) {
      throw SthandelPlatformExceptions(e.code).message;
    } catch (e) {
     throw 'Somthing Went Wrong Whene tried to get All brands Data ';
    }
  }
}