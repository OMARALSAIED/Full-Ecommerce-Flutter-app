import 'package:ecommerce/features/authentication/controllers/onborading_cotroller.dart';
import 'package:ecommerce/features/authentication/screens/onborading/widgets/on_borading_nextButton.dart';
import 'package:ecommerce/features/authentication/screens/onborading/widgets/on_borading_page.dart';
import 'package:ecommerce/features/authentication/screens/onborading/widgets/on_borading_sikp.dart';
import 'package:ecommerce/features/authentication/screens/onborading/widgets/onboarding_dot_navigation.dart';
import 'package:ecommerce/util/constants/images_strings.dart';
import 'package:ecommerce/util/theme/widgets/theme_buttonsun.dart';
import 'package:get/get.dart';
import 'package:ecommerce/util/constants/text_strings.dart';
import 'package:flutter/material.dart';


class OnboradingScreen extends StatelessWidget {
  const OnboradingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =Get.put(OnboradingCotroller());
    return  Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.UpdatePageIndicator,
            children: [
            OnBoradingPage(image: TImage.onborading1,title: TText.onBoardingTitle1,subtitle: TText.onBoardingsubTitle1,),
            OnBoradingPage(image: TImage.onborading2,title: TText.onBoardingTitle2,subtitle: TText.onBoardingsubTitle2,),
            OnBoradingPage(image: TImage.onborading3,title: TText.onBoardingTitle3,subtitle: TText.onBoardingsubTitle3,)
          ],),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60,horizontal: 20),
            child: ThemeToggleButton(),
          ),
          OnBoradingSkip(),
          OnBoardingdotNavigation(),
          OnBoardingNextButton()
        ],
      ),
    );
  }
}


