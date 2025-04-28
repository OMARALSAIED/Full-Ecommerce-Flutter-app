import 'package:ecommerce/data/repositories/user/user_repository.dart';
import 'package:ecommerce/features/authentication/models/sign_up_model.dart';
import 'package:ecommerce/util/popups/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Future<void> saveUserRecord(UserCredential userCredential) async {
    try {
      if (userCredential != null) {
        final nameParts = UserModel.nameParts(
          userCredential.user!.displayName ?? '',
        );
        final username = UserModel.generateUssername(
          userCredential.user!.displayName ?? '',
        );

        final user = UserModel(
          id: userCredential.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join('') : '',
          email: userCredential.user!.email ?? '',
          userName: username,
          phoneNumber: userCredential.user!.phoneNumber ?? '',
          profilePicture: userCredential.user!.photoURL ?? '',
        );
      await UserRepository.instance.saveUserRecord(user);
      }
    } catch (e) {
      Loader.warningSnackbar(
        'Somthing went wrong while saving your infooormation. You can re-save your data in your  Profile',
        'Data not saved',
      );
    }
  }
}
