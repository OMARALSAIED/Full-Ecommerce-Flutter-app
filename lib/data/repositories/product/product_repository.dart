

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/shop/models/BrandModel.dart';

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
      final snapshot =
          await _db
              .collection('Products')
              .where('IsFeatured', isEqualTo: true)
              .limit(4)
              .get();

      print("Documents fetched: ${snapshot.docs.length}");
      for (var doc in snapshot.docs) {
        print("Fetched Data: ${doc.data()}");
      }

      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } catch (e) {
      print("Error in getFeaturedProduct: $e");
      throw 'Something Went Wrong. Please try again';
    }
  }

  Future<List<ProductModel>> getAllFeaturedProduct() async {
    try {
      final snapshot =
          await _db
              .collection('Products')
              .where('IsFeatured', isEqualTo: true)
              .get();

      print("Documents fetched: ${snapshot.docs.length}");
      for (var doc in snapshot.docs) {
        print("Fetched Data: ${doc.data()}");
      }

      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } catch (e) {
      print("Error in getFeaturedProduct: $e");
      throw 'Something Went Wrong. Please try again';
    }
  }

  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList =
          querySnapshot.docs
              .map((doc) => ProductModel.fromQuerySnapshot(doc))
              .toList();
      return productList;
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

   Future<List<ProductModel>> getFavouriteProduct(List<String> productIds) async {
  try {
    if (productIds.isEmpty) {
      print('No product IDs provided.');
      return [];
    }

    print('Product IDs: $productIds');

    final snapshot = await _db
        .collection('Products')
        .where(FieldPath.documentId, whereIn: productIds)
        .get();

    print('Products fetched: ${snapshot.docs.length}');

    return snapshot.docs
        .map((querySnapshot) => ProductModel.fromSnapshot(querySnapshot))
        .toList();
  } on FirebaseAuthException catch (e) {
    throw SthandelAuthExpetions(e.code).message;
  } on FirebaseException catch (e) {
    throw SthandelAuthExpetions(e.code).message;
  } on SthandelFormatExceptions catch (_) {
    throw SthandelFormatExceptions();
  } on SthandelPlatformExceptions catch (e) {
    throw SthandelPlatformExceptions(e.code).message;
  } catch (e) {
    print('Error in getFavouriteProduct: $e');
    throw 'Something went wrong. Please try again.';
  }
}


  Future<List<ProductModel>> getBrandForProduct({
    required String brandId,
    int limit = -1,
  }) async {
    try {
      final querySnapshot =
          limit == -1
              ? await _db
                  .collection('Products')
                  .where('Brand.Id', isEqualTo: brandId)
                  .get()
              : await _db
                  .collection('Products')
                  .where('Brand.Id', isEqualTo: brandId)
                  .limit(limit)
                  .get();
      final products =
          querySnapshot.docs
              .map((doc) => ProductModel.fromSnapshot(doc))
              .toList();
      return products;
    } on FirebaseAuthException catch (e) {
      throw SthandelAuthExpetions(e.code).message;
    } on FirebaseException catch (e) {
      throw SthandelAuthExpetions(e.code).message;
    } on SthandelFormatExceptions catch (_) {
      throw SthandelFormatExceptions();
    } on SthandelPlatformExceptions catch (e) {
      throw SthandelPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Somthing Went getBrandForProduct Wrong Please try again';
    }
  }

  Future<List<BrandModel>> getBrandForCategory(String categoryId) async {
    try {
      QuerySnapshot brandCategoryQuery =
          await _db
              .collection('Brandcategory')
              .where('CategoryId', isEqualTo: categoryId)
              .get();
      List<String> brandId =
          brandCategoryQuery.docs
              .map((doc) => doc['brandId'] as String)
              .toList();

      final brandsQuery =
          await _db
              .collection('Brands')
              .where(FieldPath.documentId, whereIn: brandId)
              .limit(2)
              .get();
      List<BrandModel> brand =
          brandsQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();

      return brand;
    } on FirebaseAuthException catch (e) {
      throw SthandelAuthExpetions(e.code).message;
    } on FirebaseException catch (e) {
      throw SthandelAuthExpetions(e.code).message;
    } on SthandelFormatExceptions catch (_) {
      throw SthandelFormatExceptions();
    } on SthandelPlatformExceptions catch (e) {
      throw SthandelPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Somthing Went Wrong getBrandForCategory Please try again';
    }
  }

Future<List<ProductModel>> getProductForCategory({
  required String categoryId,
  int limit = 4,
}) async {
  try {
    print("Fetching products for categoryId: $categoryId with limit: $limit");

    // جلب معرّفات المنتجات المرتبطة بالفئة
    Query query = _db
        .collection('ProductCategory')
        .where('CategoryId', isEqualTo: categoryId);

    // إذا كان limit أكبر من 0، نقوم بتطبيقه
    if (limit > 0) {
      query = query.limit(limit);
    }

    final querySnapshot = await query.get();

    List<String> productIds = querySnapshot.docs
        .map((doc) => doc['productId'] as String)
        .toList();

    print("Fetched Product IDs: $productIds");

    if (productIds.isEmpty) {
      print("No product IDs found for categoryId: $categoryId");
      return [];
    }

    // جلب المنتجات بناءً على معرّفاتها
    final productQuery = await _db
        .collection('Products')
        .where(FieldPath.documentId, whereIn: productIds)
        .get();

    List<ProductModel> products = productQuery.docs
        .map((doc) => ProductModel.fromSnapshot(doc))
        .toList();

    return products;
  } catch (e) {
    print("Error in getProductForCategory: $e");
    throw 'Something went wrong in getProductForCategory. Please try again';
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
