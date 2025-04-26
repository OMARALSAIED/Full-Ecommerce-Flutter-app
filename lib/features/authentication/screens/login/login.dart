import 'package:ecommerce/common/styles/spacing_style.dart';
import 'package:ecommerce/common/wigets/app_bar/appbar.dart';
import 'package:ecommerce/common/wigets/divder_form.dart';
import 'package:ecommerce/features/authentication/screens/login/widgets/login_form.dart';
import 'package:ecommerce/features/authentication/screens/login/widgets/login_header.dart';
import 'package:ecommerce/common/wigets/social_buttons.dart';

import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/constants/text_strings.dart';

import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:ecommerce/util/theme/widgets/theme_buttonsun.dart';

import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperfunction.isDarkMode(context);

    return Scaffold(
    
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingwidthAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// -- Logo & Title
              TLoginHeader(dark: dark),
          
              /// -- Form Fields
              TLoginForm(),
          
              /// -- Dividers
              const SizedBox(height: TSize.spaceBtweenItems),
              TFormDivder(dark: dark,dividerText: TText.orContinueWith,),
              const SizedBox(height: TSize.spaceBtweenItems),
              TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}







