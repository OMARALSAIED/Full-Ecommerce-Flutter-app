
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:flutter/material.dart';

class TCheckBoxTheme
{
  TCheckBoxTheme._();
//LightCheckBoxTheme
  static CheckboxThemeData lightCheckboxTheme=CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if(states.contains(MaterialState.selected))
      {
        return AppColor.kwhite;


      }else
      {
        return AppColor.kblack;
      }
    },
  ),
  fillColor: MaterialStateProperty.resolveWith((states) {
    
if(states.contains(MaterialState.selected))
{
  return AppColor.kblue;
}else{
  return AppColor.ktransparent;
}
  },
  
  ));

  //DarkCheckBoxTheme

    static CheckboxThemeData DarkCheckboxTheme=CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if(states.contains(MaterialState.selected))
      {
        return AppColor.kwhite;


      }else
      {
        return AppColor.kblack;
      }
    },
  ),
  fillColor: MaterialStateProperty.resolveWith((states) {
    
if(states.contains(MaterialState.selected))
{
  return AppColor.kblue;
}else{
  return AppColor.ktransparent;
}
  },
  
  ));


  
}