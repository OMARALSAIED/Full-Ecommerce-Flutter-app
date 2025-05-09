
class ProductVariationModel {
  final String id;
   String sku;
   String image;
   String description;
   double price;
   double salePrice;
   String stock;

   Map<String ,String> attributeValues;

  // Constructor
  ProductVariationModel({
    required this.id,
     this.sku='',
     this.image='',
     this.description='',
     this.price=0.0,
     this.salePrice=0.0,
     this.stock='23',
     required this.attributeValues
  });

  static ProductVariationModel empty()=> ProductVariationModel(id: '', attributeValues: {});

 

  // Convert model to JSON
   toJson() {
    return {
      'Id':id,
      'SKU': sku,
      'Image': image,
      'Description': description,
      'Price': price,
      'SalePrice': salePrice,
      'Stock': stock,
      'AttributeValues':attributeValues
    };
  }

  // Create model from Firestore snapshot
  factory ProductVariationModel.fromJson(Map<String , dynamic> document) {
    final data = document;
    if(data.isEmpty)return ProductVariationModel.empty();
    return ProductVariationModel(
      id: data['Id'] ?? '',
      sku: data['SKU'] ?? '',
     
      
     price: double.tryParse(data['Price'].toString()) ?? 0.0,
      salePrice: double.tryParse(data['SalePrice'].toString()) ?? 0.0,  // ✅ التأكد من الحقل
      image: data['Image'] ?? '',
      description: data['Description'] ?? '',
      stock: data['Stock'] ?? 0,
      attributeValues: Map<String, String>.from(data['AttributeValues'] ?? {}),
    );
  }
}
