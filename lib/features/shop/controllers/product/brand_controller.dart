

import 'package:ecommerce/data/repositories/Brands/brand_repository.dart';
import 'package:ecommerce/data/repositories/product/product_repository.dart';
import 'package:ecommerce/features/shop/models/BrandModel.dart';
import 'package:ecommerce/features/shop/models/ProductModel.dart';
import 'package:ecommerce/util/popups/loader.dart';
import 'package:get/get.dart';


class BrandController extends GetxController {
  static BrandController get instance=>Get.find();
  RxBool isLoading=true.obs;
   final RxList<BrandModel> allBrands=<BrandModel>[].obs;
  final RxList<BrandModel> featuredBrands=<BrandModel>[].obs;
  final brandRepository=Get.put(BrandRepository())
;
  @override
  void onInit()
  {
    getFeaturedBrand();
    super.onInit();
  }

  //Load Brand
  Future<void> getFeaturedBrand() async {
  try {
    isLoading.value = true;
    final brands = await brandRepository.getAllBrands();
    print("Brands Fetched: ${brands.length}");  // ✅ عدد البراندات المسترجعة
    
    if (brands.isEmpty) {
      print("No Brands Found");
    }

    allBrands.assignAll(brands);
    
    featuredBrands.assignAll(
      brands.where((brand) => brand.IsFeatured ?? false).take(4),
    );

    print("Featured Brands: ${featuredBrands.length}");
  } catch (e) {
    print("Error in getFeaturedBrand: $e");
    Loader.errorSnackbar(e.toString(), 'Oh Snap!');
  } finally {
    isLoading.value = false;
  }
}


  //get Brands Specific Product from your data source
  Future<List<BrandModel>> getBrandforCategory(String categoryId)async
  {
    try {
  final product=await ProductRepository.instance.getBrandForCategory(categoryId);
  return product;
} on Exception catch (e) {
  Loader.errorSnackbar(e.toString(), 'Oh Snap!');
  return [];
}}
  //Get Brands for category
Future<List<ProductModel>> getBrandForproduct({required String brandId,int limit=-1})async
  {
    try {
  final product=await ProductRepository.instance.getBrandForProduct(brandId: brandId,limit: limit);
  return product;
} on Exception catch (e) {
  Loader.errorSnackbar(e.toString(), 'Oh Snap!');
  return [];
}}
  


  }