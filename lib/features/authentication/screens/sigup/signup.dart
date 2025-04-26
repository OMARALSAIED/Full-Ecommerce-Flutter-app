import 'package:ecommerce/common/wigets/divder_form.dart';
import 'package:ecommerce/common/wigets/social_buttons.dart';
import 'package:ecommerce/features/authentication/screens/sigup/widgets/sinup_form.dart';

import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/constants/text_strings.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelperfunction.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body:Padding(padding: EdgeInsets.all(TSize.defaultspace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TText.signUptitle,style: Theme.of(context).textTheme.headlineMedium,),
          const SizedBox(height: TSize.spaceBtwSections,),
        
          TsignUpForm(dark: dark),
          const SizedBox(height: TSize.spaceBtwSections,),

          TFormDivder(dark: dark, dividerText:TText.orLoginwith),

          const SizedBox(height: TSize.spaceBtwSections,),

          const TSocialButtons()
        ],
      ),
    ));
  }
}

