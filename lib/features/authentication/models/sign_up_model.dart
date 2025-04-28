import 'package:ecommerce/util/formattera/formatter.dart';

class UserModel {
  final String id;
  
   String firstName;
   String lastName;
   final String email;
   String? password;
  final String userName;
   String phoneNumber;
   String profilePicture;

  UserModel({
    required this.id,
   
    required this.firstName,
    required this.lastName,
     required this.email,
     this.password,
    required this.userName,
    required this.phoneNumber,
    required this.profilePicture,
  });

  String get fullName=>'$firstName $lastName';
  static List<String> nameParts(fullName)=>fullName.split('');
  String get formattedPhoneNo=>TFormatter.formatPhoneNumber(phoneNumber);
  static String generateUssername(fullname)
  {
    List<String> nameParts=fullname.split("");
    String firstName=nameParts[0].toLowerCase();
    String lastName=nameParts.length>1 ? nameParts[1].toLowerCase(): "";

    String camelCasUsername="$firstName$lastName";
    String usernameWithPerfix="cwt_$camelCasUsername";
    return usernameWithPerfix;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
     
      'firstName': firstName,
      'lastName': lastName,
        'userName': userName,
       'email': email,
      'password': password,
    
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
     
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
         userName: json['userName'] ?? '',
       email: json['email'] ?? '',
      password: json['password'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      profilePicture: json['profilePicture'] ?? '',
    );
  }
}
