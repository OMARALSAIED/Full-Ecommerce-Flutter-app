import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/shop/models/ProductModel.dart';
import 'package:ecommerce/util/constants/enums.dart';
import 'package:ecommerce/util/helpers/firebase_storge_service.dart';
import 'package:ecommerce/util/valdatores/auth_Exceptions.dart';
import 'package:ecommerce/util/valdatores/format_Exceptions.dart';
import 'package:ecommerce/util/valdatores/platform_Exceptioon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

Future<List<ProductModel>> getFeaturedProduct() async {
  try {
    final snapshot = await _db
        .collection('Products')
        .where('IsFeatured', isEqualTo: true)
        .limit(4)
        .get();

    print("Documents fetched: ${snapshot.docs.length}");
    for (var doc in snapshot.docs) {
      print("Fetched Data: ${doc.data()}");
    }

    return snapshot.docs
        .map((e) => ProductModel.fromSnapshot(e))
        .toList();
  } catch (e) {
    print("Error in getFeaturedProduct: $e");
    throw 'Something Went Wrong. Please try again';
  }
}
Future<List<ProductModel>> getAllFeaturedProduct() async {
  try {
    final snapshot = await _db
        .collection('Products')
        .where('IsFeatured', isEqualTo: true)
       
        .get();

    print("Documents fetched: ${snapshot.docs.length}");
    for (var doc in snapshot.docs) {
      print("Fetched Data: ${doc.data()}");
    }

    return snapshot.docs
        .map((e) => ProductModel.fromSnapshot(e))
        .toList();
  } catch (e) {
    print("Error in getFeaturedProduct: $e");
    throw 'Something Went Wrong. Please try again';
  }
}


Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
  try {
  
      final querySnapshot=await query.get();
      final List<ProductModel> productList=querySnapshot.docs.map((doc)=>ProductModel.fromQuerySnapshot(doc)).toList();
      return productList;

  }   on FirebaseAuthException catch (e) {
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
 Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      final storge = Get.put(FirebaseStorgeService());

      for (var product in products) {
        final thumbnail = await storge.getImageDataFromAssets(
          product.thumbnail,
        );

        final url = await storge.uploadImageData(
          'Products/Images',
          thumbnail,
          product.thumbnail.toString(),
        );

        product.thumbnail = url;

        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrl = [];
          for (var image in product.images!) {
            final asstesImage = await storge.getImageDataFromAssets(image);
            final url = await storge.uploadImageData(
              'Products/Images',
              asstesImage,
              image,
            );

            imagesUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }

        //Upload Variation Images

        if (product.productType ==
            ProductType.variable.toString()) //we try to use enmu
        {
          for (var variation in product.productVariation!) {
            final asstesImage = await storge.getImageDataFromAssets(
              variation.image,
            );
            final url = await storge.uploadImageData(
              'Products/Images',
              asstesImage,
              variation.image,
            );

            variation.image = url;
          }
        }
        await _db.collection('Products').doc(product.id).set(product.toJson());
      }
    } on FirebaseAuthException catch (e) {
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