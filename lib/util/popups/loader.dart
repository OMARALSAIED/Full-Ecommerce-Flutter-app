import 'package:ecommerce/util/constants/AppColors.dart';
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
}
