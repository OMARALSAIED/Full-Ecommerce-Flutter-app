import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  final String Id;
  final String Name;
  final String Image;
  final bool? IsFeatured;
  final String? ProductCount;
  final DateTime? createdAt;

  BrandModel({
    required this.Id,
    required this.Name,
    required this.Image,
    this.IsFeatured,
    this.ProductCount,
    this.createdAt,
  });

  static BrandModel empty() {
    return BrandModel(
      Id: '',
      Name: '',
      Image: '',
      IsFeatured: false,
      ProductCount: '',
      createdAt: DateTime.now(),
    );
  }

  toJson() {
    return {
      'Id': Id,
      'Name': Name,
      'Image': Image,
      'IsFeatured': IsFeatured,
      'ProductCount': ProductCount,
      
    };
  }

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      Id: json['Id'] ?? '',
      Name: json['Name'] ?? '',
      Image: json['Image'] ?? '',
      IsFeatured: json['IsFeatured'] ?? false,
      ProductCount: json['ProductCount'] ?? 0,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
    );
  }

  factory BrandModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return BrandModel(
      Id: snapshot.id,
      Name: data['Name'] ?? '',
      Image: data['Image'] ?? '',
      IsFeatured: data['IsFeatured'] ?? false,
      ProductCount: data['ProductCount'] ?? 0,
      createdAt: (data['createdAt'] as Timestamp?)?.toDate(),
    );
  }
}
