import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String Image;
  String Name;
  String ParentId;
  bool Isfeatured;

  CategoryModel({
    required this.id,
    required this.Name,
    required this.Image,
    this.ParentId = '',
    required this.Isfeatured,
  });


  // ✅ Empty Helper Function
  static CategoryModel empty() => CategoryModel(
        id: '',
        Name: '',
        Image: '',
        ParentId: '',
        Isfeatured: false,
      );

  // ✅ From JSON
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? '',
      Name: json['Name'] ?? '',
      Image: json['Image'] ?? '',
      ParentId: json['ParentId'] ?? '',
      Isfeatured: json['Isfeatured'] ?? false,
    );
  }

  // ✅ To JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Name': Name,
      'Image': Image,
      'ParentId': ParentId,
      'Isfeatured': Isfeatured,
    };
  }

  // ✅ From Firestore Document Snapshot
  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {

    if(doc.data() !=null){  
      final data = doc.data()!;
    return CategoryModel(
      id: doc.id,
      Name: data['Name'] ?? '',
      Image: data['Image'] ?? '',
      ParentId: data['ParentId'] ?? '',
      Isfeatured: data['Isfeatured'] ?? false,
    );}else{
    return CategoryModel.empty();
  }
  
  }
}
