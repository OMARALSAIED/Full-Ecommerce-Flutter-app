
import 'package:ecommerce/data/repositories/categories/category_repository.dart.dart';
import 'package:ecommerce/data/repositories/product/product_repository.dart';
import 'package:ecommerce/features/shop/models/ProductModel.dart';
import 'package:ecommerce/features/shop/models/category_model.dart';
import 'package:ecommerce/util/popups/loader.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CategoryController extends GetxController
{
  static CategoryController get insatnce => Get.find();
  final isLoading=false.obs;

  final _categoryRepository=Get.put(CategoryRepository());

  RxList<CategoryModel> allCategories =<CategoryModel>[].obs;
   RxList<CategoryModel> featuredCategories =<CategoryModel>[].obs;

  @override
  void onInit()
  {
    fetchCategories();
    super.onInit();
    
  }


  // -- Load categeory
  
  Future<void> fetchCategories()async
  {
    try{

      // Show loader while loading categores
      isLoading.value=true;
       
      // Fetch categoies form data source (Firestore, API , etc)

      final categories=await  _categoryRepository.getAllCategories();

      //update the categories
      allCategories.assignAll(categories);
      //filter featured categories

      featuredCategories.assignAll(allCategories.where((category)=>category.Isfeatured && category.ParentId.isEmpty).take(8).toList());
      //   print('All Categories: ${categories.length}');
      // print('Filtered Featured Categories: ${allCategories.where((category)=>category.Isfeatured && category.ParentId.isEmpty).length}');

        
    }catch(e)
    {
      Loader.errorSnackbar(e.toString(), 'Oh Snap!');
    }finally {
      //Remove Loader
      isLoading.value=false;
    }
  }
  // -- Load selected category data
  // Get Category or Sub-Category Products.
  Future<List<ProductModel>> getCategoryProdycts({required String categoryId,int limit=4})async
  {
    final products=await ProductRepository.instance.getProductForCategory(categoryId:categoryId,limit: limit);
    return products;

  }

}