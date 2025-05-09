import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/shop/models/BrandModel.dart';
import 'package:ecommerce/features/shop/models/ProductVariationModel.dart';
import 'package:ecommerce/features/shop/models/productAttributeModel.dart';

class ProductModel {
  String id;
  
  String stock;
  String? sku;
  double price;
  double salePrice;
  String title;
  String thumbnail;
  String? Description;
  DateTime? date;
  bool? IsFeatured;
  BrandModel? brand;
  String? categoryId;
  List<String>? images;
  String productType;
  List<productAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariation;

  ProductModel({
    required this.id,
    required this.stock,
    required this.price,
    required this.title,
    required this.thumbnail,
    required this.productType,
    this.sku,
    this.salePrice = 0.0,
    this.Description,
    this.date,
    this.IsFeatured,
    this.brand,
    this.categoryId,
    this.images,
    this.productAttributes,
    this.productVariation,
  });

  static ProductModel empty() => ProductModel(
    id: '',
    stock: '',
    price: 0.0,
    title: '',
    thumbnail: '',
    productType: '',
  );

  toJson() {
    return {
      'id': id,
      'stock': stock,
      'sku': sku,
      'price': price,
      'salePrice': salePrice,
      'Title': title,
      'Thumbnail': thumbnail,
      'Description': Description,
      'date': date?.toIso8601String(),
      'IsFeatured': IsFeatured,
      'brand': brand?.toJson(),
      'categoryId': categoryId,
      'images': images,
      'productType': productType,
      'productAttributes':
          productAttributes != null
              ? productAttributes!.map((e) => e.toJson()).toList()
              : [],
      'productVariation':
          productVariation != null
              ? productVariation!.map((e) => e.toJson()).toList()
              : [],
    };
  }

factory ProductModel.fromJson(Map<String, dynamic> json) {
  return ProductModel(
    id: json['id'] ?? '',
    stock: json['Stock'] ?? '',
    
    sku: json['SKU'],
    price: (json['Price'] as num?)?.toDouble() ?? 0.0,
    salePrice: (json['SalePrice'] as num?)?.toDouble() ?? 0.0,
    title: json['Title'] ?? '',
    thumbnail: json['Thumbnail'] ?? '',
    Description: json['Descrption'] ?? '',  // ✅ تعديل التهجئة هنا
    date: json['date'] != null ? DateTime.tryParse(json['date']) : null,
    IsFeatured: json['IsFeatured'] ?? false,
    brand: json['Brand'] != null ? BrandModel.fromJson(json['Brand']) : null,
    categoryId: json['CategoryId'],
    images: json['Images'] != null ? List<String>.from(json['Images']) : [],
    productType: json['ProductsType'] ?? '',  // ✅ تعديل التهجئة هنا
    productAttributes: json['ProductAttributes'] != null
        ? (json['ProductAttributes'] as List<dynamic>)
            .map((e) => productAttributeModel.fromJson(e))
            .toList()
        : [],
    productVariation: json['ProductVariations'] != null
        ? (json['ProductVariations'] as List<dynamic>)
            .map((e) => ProductVariationModel.fromJson(e))
            .toList()
        : [],
  );
}


factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
  final data = snapshot.data();
  if (data == null) return ProductModel.empty();

  return ProductModel(
    id: snapshot.id,
    stock: data['Stock'] ?? '',
    sku: data['SKU'] ?? '',
    price: double.tryParse(data['Price'].toString()) ?? 0.0,
    salePrice: double.tryParse(data['SalePrice'].toString()) ?? 0.0,
    title: data['Title'] ?? '',
    thumbnail: data['Thumbnail'] ?? '',
    Description: data['Descrption'] ?? '',  // ✅ تعديل التهجئة هنا
    IsFeatured: data['IsFeatured'] ?? false,
    brand: data['Brand'] != null ? BrandModel.fromJson(data['Brand']) : null,
    categoryId: data['CategoryId'] ?? '',
    images: data['Images'] != null ? List<String>.from(data['Images']) : [],
    productType: data['ProductsType'] ?? '',  // ✅ تعديل التهجئة هنا
    productAttributes: data['ProductAttributes'] != null
        ? (data['ProductAttributes'] as List<dynamic>)
            .map((e) => productAttributeModel.fromJson(e))
            .toList()
        : [],
    productVariation: data['ProductVariations'] != null
        ? (data['ProductVariations'] as List<dynamic>)
            .map((e) => ProductVariationModel.fromJson(e))
            .toList()
        : [],
  );
}


}
