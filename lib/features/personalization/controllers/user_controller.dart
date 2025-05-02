import 'package:ecommerce/common/wigets/internet/network_manger.dart';
import 'package:ecommerce/data/repositories/auth/authentication_repositry.dart';
import 'package:ecommerce/data/repositories/user/user_repository.dart';
import 'package:ecommerce/features/authentication/models/sign_up_model.dart';
import 'package:ecommerce/features/authentication/screens/login/login.dart';
import 'package:ecommerce/features/personalization/screens/Profile/widgets/re_authentecate_user_login_form.dart';
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/images_strings.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/popups/full_screen_loader.dart';
import 'package:ecommerce/util/popups/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  Rx<UserModel> user = UserModel.empty().obs;
  final verifiyPassword = TextEditingController();
  final hidPassword = true.obs;
  final verifiyEmail = TextEditingController();
  final imageUplad=false.obs;
  final profileLoading = false.obs;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> ReAuthLoginFormkey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDeatiles();
      this.user(user);
      profileLoading.value = false;
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  Future<void> saveUserRecord(UserCredential userCredential) async {
    try {
      //Refresh User Record
      await fetchUserRecord();
      if(user.value.id.isEmpty)
      {
      // ignore: unnecessary_null_comparison
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
      }
    } catch (e) {
      Loader.warningSnackbar(
        'Somthing went wrong while saving your infooormation. You can re-save your data in your  Profile',
        'Data not saved',
      );
    }
  }

  void deleteAccountWaringPoup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSize.md),
      title: 'Delete Account',
      middleText:
          'Are you sure you eant to delete your account permanently? This action is not reversbile and all og your data will be removed permnently',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.kred,
          side: BorderSide(color: AppColor.kred),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: TSize.lg),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        child: const Text('Canel'),
        onPressed: () {
          Navigator.of(Get.overlayContext!).pop();
        },
      ),
    );
  }

  void deleteUserAccount() async {
    try {
      final auth = AuthenticationRepositry.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          FullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          FullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loader.warningSnackbar(e.toString(), 'Oh Snap!');
    }
  }

  Future<void> reAuthenticateEmailAndPassword() async {
    try {
      FullScreenLoader.openLoadingDiloG('Processing', TImage.loading);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }
      if (!ReAuthLoginFormkey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepositry.instance.reauthenticateWithEmailAndPassword(
        verifiyEmail.text.trim(),
        verifiyPassword.text.trim(),
      );

      await AuthenticationRepositry.instance.deleteAccount();
      FullScreenLoader.stopLoading();
      Get.offAll(() => LoginScreen());
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loader.errorSnackbar(e.toString(), 'Oh Snap!');
    }
  }


  uploadUserProfilePictuer()async
  {
    try{
       final image =await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 70,maxHeight: 512,maxWidth: 512);
     if(image!=null)
     {
      imageUplad.value=true;
      //Upload Image
      final imageUrl=await userRepository.uploadImage(TImage.nikee, image);
      //Update User Image Record
      Map<String ,dynamic> json={'profilePicture' : imageUrl};
      await userRepository.updateSingleFiled(json);
      user.value.profilePicture=imageUrl;
      user.refresh();

      Loader.successSnackbar('Your Profile Image has been updated!', 'Congratulations');
     }
    }catch(e)
  {
     Loader.errorSnackbar(e.toString(), 'Oh snap!');
  }finally{
    imageUplad.value=false;
  }
  }
}
