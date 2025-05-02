import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/shop/models/category_model.dart';
import 'package:ecommerce/util/helpers/firebase_storge_service.dart';
import 'package:ecommerce/util/valdatores/auth_Exceptions.dart';
import 'package:ecommerce/util/valdatores/format_Exceptions.dart';
import 'package:ecommerce/util/valdatores/platform_Exceptioon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CategoriesRepositry extends GetxController {
  static CategoriesRepositry get insatnce=>Get.find();

  final _db=FirebaseFirestore.instance;

  Future<List<CategoryModel>> getAllCategories()async
  {
    try{
      final snapshot=await _db.collection('Categories').get();
      final list=snapshot.docs.map((document)=> CategoryModel.fromSnapshot(document)).toList();
      return list;
    }on FirebaseAuthException catch (e) {
      throw SthandelAuthExpetions(e.code).message;
    } on FirebaseException catch (e) {
      throw SthandelAuthExpetions(e.code).message;
    } on SthandelFormatExceptions catch (_) {
      throw SthandelFormatExceptions();
    } on SthandelPlatformExceptions catch (e) {
      throw SthandelPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Somthing Went Wrong Please try again';
    }
  }


   Future<void> UploaddummeyData(List<CategoryModel> categories)async
  {
    try{
      final storge=Get.put(FirebaseStorgeService());
      for(var category in categories)
      {
        final file=await  storge.getImageDataFromAssets(category.Image);

        final url=await storge.uploadImageData('Categories', file,category.Name);

        category.Name=url;

        await _db.collection('Categories').doc(category.id).set(category.toJson());

      }
      
      
    }on FirebaseAuthException catch (e) {
      throw SthandelAuthExpetions(e.code).message;
    } on FirebaseException catch (e) {
      throw SthandelAuthExpetions(e.code).message;
    } on SthandelFormatExceptions catch (_) {
      throw SthandelFormatExceptions();
    } on SthandelPlatformExceptions catch (e) {
      throw SthandelPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Somthing Went Wrong Please try again';
    }
  }
} 