import 'dart:convert';

import 'package:ecommerce/data/repositories/product/product_repository.dart';
import 'package:ecommerce/features/shop/models/ProductModel.dart';
import 'package:ecommerce/util/local_storage/local_storge.dart';
import 'package:ecommerce/util/popups/loader.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class FavouritController extends GetxController {
  static FavouritController get instance => Get.find();

  final favorite = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavorites();
  }

  void initFavorites() {
    final json = TLocalStorage.instance().readData('favorites');
    if (json != null) {
      final storageFavorite = jsonDecode(json) as Map<String, dynamic>;
      favorite.assignAll(storageFavorite.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String productId) {
    return favorite[productId] ?? false;
  }

 void toggleFavouriteProduct(String productId) {
  if (favorite.containsKey(productId)) {
    favorite[productId] = !favorite[productId]!;
    Loader.CustomTost(
      message: favorite[productId]! 
          ? 'Product has been added to Wishlist.' 
          : 'Product has been removed from Wishlist.'
    );
    if (!favorite[productId]!) {
      favorite.remove(productId); // إزالة المنتج من القائمة إذا كانت القيمة false
    }
  } else {
    favorite[productId] = true;
    Loader.CustomTost(message: 'Product has been added to Wishlist.');
  }

  saveFavouriteToStorage();
  favorite.refresh(); // تحديث الحالة لعرض المنتجات الجديدة في الشاشة
}


  void saveFavouriteToStorage() {
    final encodedFavorite = json.encode(favorite);
    TLocalStorage.instance().saveData('favorites', encodedFavorite);
  }

  Future<List<ProductModel>> favoriteProduct() async {
    return await ProductRepository.instance.getFavouriteProduct(favorite.keys.toList());
  }
}
