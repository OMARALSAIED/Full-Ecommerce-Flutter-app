import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/shop/models/banners_model.dart';
import 'package:ecommerce/util/valdatores/auth_Exceptions.dart';
import 'package:ecommerce/util/valdatores/format_Exceptions.dart';
import 'package:ecommerce/util/valdatores/platform_Exceptioon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  //variables

  final _db = FirebaseFirestore.instance;

  //Get all order reated to current User
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result=await _db.collection('Banners').where('Activ',isEqualTo: true).get();
      return result.docs.map((documentSnapshot)=>BannerModel.fromSnapshot(documentSnapshot)).toList();
    }
     on FirebaseAuthException catch (e) {
      throw SthandelAuthExpetions(e.code).message;
    } on FirebaseException catch (e) {
      throw SthandelAuthExpetions(e.code).message;
    } on SthandelFormatExceptions catch (_) {
      throw SthandelFormatExceptions();
    } on SthandelPlatformExceptions catch (e) {
      throw SthandelPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Somthing Went Wrong whene fetching Banners ';
    }
  }
}
