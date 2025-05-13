import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/data/repositories/product/product_repository.dart';
import 'package:ecommerce/features/shop/models/ProductModel.dart';
import 'package:ecommerce/util/popups/loader.dart';
import 'package:get/get.dart';

class AllProductsController extends GetxController {
  static AllProductsController get instance=>Get.find();
  final RxString selectedSortOption='Name'.obs;
  final RxList<ProductModel>  products=<ProductModel>[].obs;
  final repository=ProductRepository.instance;
  
  
  Future<List<ProductModel>> fetchProductsByQuery(Query? query)async
  {
    try{
      if(query==null)return [];
     final product=await  repository.fetchProductsByQuery(query);
     print("The result of query$product");
     return product;
    }catch(e)
    {
      Loader.errorSnackbar(e.toString(), 'Oh Snap!');
      return [];
    }
  }
  
  void sortProducts(String sortOption)
  {
    selectedSortOption.value=sortOption;
    switch (sortOption)
    {
      case 'Name':products.sort((a,b)=>a.title.compareTo(b.title));
      break;
      case 'Higher Price':products.sort((a,b)=>a.title.compareTo(b.title));
      break;
      case 'Lower Price':products.sort((a,b)=>a.title.compareTo(b.title));
      break;
     
      case 'Newest':products.sort((a,b)=>a.title.compareTo(b.title));
      break;
       case 'Popularty':products.sort((a,b)=>a.title.compareTo(b.title));
      break;
       case 'Sale':products.sort((a,b){
        if(b.salePrice >0)
        {
          return b.salePrice.compareTo(a.salePrice);
        }else  if(a.salePrice>0)
        {
          return -1;
        }else{
          return 1;
        }
       });
      break;
      default:products.sort((a,b)=>a.title.compareTo(a.title));
      
    }
  }

  void assignProduct(List<ProductModel> product)
  {
    this.products.assignAll(product);
    sortProducts('Name');
  }

}