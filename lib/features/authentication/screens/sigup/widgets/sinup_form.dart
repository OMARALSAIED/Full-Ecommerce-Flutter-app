
import 'package:ecommerce/features/authentication/screens/sigup/widgets/terms_andConitiion_checkBox.dart';

import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/constants/text_strings.dart';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class TsignUpForm extends StatelessWidget {
  const TsignUpForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Form(child: Column(children: [
    
    
      Row(children: [
        Expanded(
          child: TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: TText.firstname,prefixIcon: Icon(Iconsax.user)
            ),
          ),
        ),
        const SizedBox(width: TSize.spaceBtwInputFiled,),
          Expanded(
          child: TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: TText.lastname,prefixIcon: Icon(Iconsax.user)
            ),
          ),
        ),
     
       
       
          
      ],),
             const SizedBox(height: TSize.spaceBtwInputFiled,),
     TextFormField(decoration: const InputDecoration(
      labelText: TText.username,
      prefixIcon: Icon(Iconsax.user_edit)
     ),),
                  const SizedBox(height: TSize.spaceBtwInputFiled,),
     TextFormField(decoration: const InputDecoration(
      labelText: TText.email,
      prefixIcon: Icon(Iconsax.direct)
     ),),
                  const SizedBox(height: TSize.spaceBtwInputFiled,),
     TextFormField(decoration: const InputDecoration(
      labelText: TText.phoneNumber,
      prefixIcon: Icon(Iconsax.call)
     ),),
      const SizedBox(height: TSize.spaceBtwInputFiled,),
      TextFormField(decoration: const InputDecoration(
      labelText: TText.password,
      prefixIcon: Icon(Iconsax.eye_slash)
     ),),
    
     termsAndConitiionCheckbox(dark: dark),
     SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){}, child: const Text(TText.CreateAccount)),)
        
    ],));
  }
}

