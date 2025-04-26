import 'package:ecommerce/util/theme/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isDarkMode = Get.find<ThemeController>().isDarkMode.value;

      return IconButton(
        icon: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          transitionBuilder: (child, animation) =>
              RotationTransition(turns: animation, child: child),
          child: Icon(
            isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
            key: ValueKey<bool>(isDarkMode),
            color: isDarkMode ? Colors.amber : Colors.indigo,
            size: 28,
          ),
        ),
        onPressed: () {
          Get.find<ThemeController>().toggleTheme();
        },
        tooltip: isDarkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode',
      );
    });
  }
}
 