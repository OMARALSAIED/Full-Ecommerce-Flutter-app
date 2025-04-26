import 'package:ecommerce/features/authentication/screens/login/login.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

class OnboradingCotroller extends GetxController {
  static OnboradingCotroller get inctance=>Get.find();

  final pageController =PageController();

  Rx<int> currentPageIndex = 0.obs;

  // Update page indicator
  void UpdatePageIndicator(int index) {
    currentPageIndex.value = index; // Use .value to set the Rx<int> value
  }

  // Handle dot navigation click
  void dotNavigationClik(int index) {
    currentPageIndex.value = index; // Use .value to set the Rx<int> value
    pageController.jumpToPage(index); // Update pageController to the correct page
  }

  // Move to the next page
  void NextPage() {
    if (currentPageIndex.value == 2) {
      final storge=GetStorage();
      storge.write('isFristTime', false);
      // Uncomment and navigate to LoginScreen when done
      Get.to(()=> LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page); // Move to the next page
     
    }
  }

  // Skip to the last page
  void skipPage() {
    currentPageIndex.value = 2; // Skip to the last page
    pageController.jumpToPage(2); // Jump to the last page
  }
}

