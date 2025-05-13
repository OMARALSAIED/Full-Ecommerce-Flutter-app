

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


  //Get Brands for category
  Future<List<ProductModel>> getBrandProduct(String brandId)async
  {
    try {
  final product=await ProductRepository.instance.getProductFromBrand(brandId: brandId);
  return product;
} on Exception catch (e) {
  Loader.errorSnackbar(e.toString(), 'Oh Snap!');
  return [];
}}

  //get Brands Specific Product from your data source
  }