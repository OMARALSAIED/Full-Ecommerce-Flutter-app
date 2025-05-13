import 'package:ecommerce/data/repositories/product/product_repository.dart';
import 'package:ecommerce/features/shop/models/ProductModel.dart';
import 'package:ecommerce/util/constants/enums.dart';
import 'package:ecommerce/util/popups/loader.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository =Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProduct();
    super.onInit();
  }

 void fetchFeaturedProduct() async {
  try {
    isLoading.value = true;
    print("Fetching featured products...");
    final products = await ProductRepository.instance.getFeaturedProduct();
    print("Products fetched: ${products.length}");
    
    for (var product in products) {
      print("Product Price: ${product.price}");
      print("Is Featured: ${product.IsFeatured}");
    }
print("Assigning products to featuredProducts...");
    featuredProducts.assignAll(products);
  } catch (e) {
    Loader.errorSnackbar(e.toString(), 'Oh Snap!');
    print("Error fetching products: $e");
  } finally {
    isLoading.value = false;
  }
}

 Future<List<ProductModel>> fetchAllFeaturedProduct() async {
  try {
    
    final products = await productRepository.getAllFeaturedProduct();
   
    return products;
  } catch (e) {
    Loader.errorSnackbar(e.toString(), 'Oh Snap!');
    print("Error fetching products: $e");
    return [];
  } 
}


String getProductPrice(ProductModel product) {
  double smallsetPrice = double.infinity;
  double largestPrice = 0.0;
  if (product.productType == ProductType.single.toString()) {
    return (product.salePrice > 0 ? product.salePrice : product.price).toString();
  } else {
    for (var variation in product.productVariation?? []) {
      double priceToConsider = variation.salePrice > 0.0 ? variation.salePrice : variation.price;

      if (priceToConsider < smallsetPrice) {
        smallsetPrice = priceToConsider;
      }
      if (priceToConsider > largestPrice) {
        largestPrice = priceToConsider;
      }
    }
    if (smallsetPrice.isEqual(largestPrice)) {
      return largestPrice.toString();
    } else {
      return '\$${smallsetPrice} - \$${largestPrice}';
    }
  }
}

String? calculateSalePercentage(double originalPrice, double? salePrice) {
  if (salePrice == null || salePrice <= 0 || originalPrice <= 0) return null;

  double remainingPercentage = (salePrice / originalPrice) * 100;
  return remainingPercentage.toStringAsFixed(0);
}



  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}
