import 'package:cloud_firestore/cloud_firestore.dart';
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

  String get fullName => '$firstName $lastName';

  static List<String> nameParts(String fullName) => fullName.split(' ');

  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  static String generateUssername(String fullName) {
    List<String> nameParts = fullName.split(' ');
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCasUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCasUsername";
    return usernameWithPrefix;
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
  static UserModel empty()=>UserModel(id: '', firstName: '', lastName: '', email: '', userName: '', phoneNumber: '', profilePicture: '');

  /// Create UserModel from Firestore DocumentSnapshot
  factory UserModel.fromSnapshot(DocumentSnapshot <Map<String ,dynamic>> document) {
    final data = document.data() as Map<String, dynamic>?;

   if(data !=null)
   {
    
     return UserModel(
      id: document.id,
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      userName: data['userName'] ?? '',
      email: data['email'] ?? '',
      password: data['password'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      profilePicture: data['profilePicture'] ?? '',
    );
   }else
   {
    return UserModel.empty();
   }
  }

  /// Convert UserModel to Firestore document (without `id` field)
  Map<String, dynamic> toDocumentSnapshot() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
    };
  }
}
