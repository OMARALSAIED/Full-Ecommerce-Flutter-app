

class productAttributeModel {
 final String? name;
final  List<String>? values;

  productAttributeModel({this.values,this.name});


  toJson()
  {
    return {'Name':name,'Values':values};
  }

  // Factory constructor to create from JSON
  factory productAttributeModel.fromJson(Map<String, dynamic> document) {
    final data=document;
 
 if(data.isEmpty) return productAttributeModel();
 
  return productAttributeModel(
    name: data.containsKey('Name') ? data['Name'] : '',
    values: List<String>.from(data['Values']),
  );
}
}