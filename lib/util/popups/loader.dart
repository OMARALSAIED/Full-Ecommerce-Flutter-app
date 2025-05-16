import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loader {
  static void successSnackbar(String message, title) {
    Get.showSnackbar(
      GetSnackBar(
        title:  "$title✅",
        messageText: Row(
          children:  [
            Icon(Icons.check_circle, color: Colors.white),
            SizedBox(width: 10),
            Expanded(
              child: Text(
               message,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        isDismissible: true,
        margin: const EdgeInsets.all(10),
        borderRadius: 8,
      ),
    );
  }

  static void errorSnackbar(String message,title ) {
    Get.showSnackbar(
      GetSnackBar(
        messageText: Row(
          children: const [
            Icon(Icons.error_outline, color: Colors.white),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                "حدث خطأ ❌",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        isDismissible: true,
        margin: const EdgeInsets.all(10),
        borderRadius: 8,
      ),
    );
  }

  static void warningSnackbar(String message, title) {
        Get.showSnackbar(
      GetSnackBar(
 
        title: title,
        messageText: Row(
          children: const [
            Icon(Icons.hourglass_bottom, color: Colors.white),
            SizedBox(width: 10),

            Expanded(
              child: Text(
                "⏳",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),

        backgroundColor: AppColor.korange,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        isDismissible: true,
        margin: const EdgeInsets.all(10),
        borderRadius: 8,
      ),
    );
  }

  static CustomTost({required message})
  
  {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: AppColor.transparent,
        content: Container(
          padding:  EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: THelperfunction.isDarkMode(Get.context!) ? AppColor.kblack.withOpacity(0.9) : AppColor.kwhite.withOpacity(0.9)
          ),
          child: Center(child: Text(message,style: Theme.of(Get.context!).textTheme.labelLarge,),),
        )
      ),
    );
  }
}
