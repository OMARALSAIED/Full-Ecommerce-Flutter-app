import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
 
  final bool Activ;
  final String imageUrl;
  final String targetScreen;

  BannerModel({
    
    required this.Activ,
    required this.imageUrl,
    required this.targetScreen,
  });



  Map<String, dynamic> toJson() {
    return {
      'Activ': Activ,
      'ImageUrl': imageUrl,
      'TargetScreen': targetScreen,
    };
  }



    factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) {
      final data=snapshot.data() as Map<String ,dynamic>;
    return BannerModel(
      
      Activ: data['Activ'] ?? false,
      imageUrl: data['ImageUrl'] ?? '',
      targetScreen: data['TargetScreen'] ?? ''
    );
    
  }
  

}
