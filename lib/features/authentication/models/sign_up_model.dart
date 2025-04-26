import 'package:ecommerce/util/formattera/formatter.dart';

class UserModel {
  final String id;
  
   String firstName;
   String lastName;
   final String email;
   String password;
  final String userName;
   String phoneNumber;
   String profilePicture;

  UserModel({
    required this.id,
   
    required this.firstName,
    required this.lastName,
     required this.email,
    required this.password,
    required this.userName,
    required this.phoneNumber,
    required this.profilePicture,
  });

  String get fullName=>'$firstName $lastName';
  String get formattedPhoneNo=>TFormatter.formatPhoneNumber(phoneNumber);

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
