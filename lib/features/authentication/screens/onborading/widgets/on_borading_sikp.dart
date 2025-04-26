import 'package:ecommerce/features/authentication/controllers/onborading_cotroller.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:ecommerce/util/device/device_utility.dart';
import 'package:flutter/material.dart';

class OnBoradingSkip extends StatelessWidget {
  const OnBoradingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUitles.getAppBarHeight(),
      right: TSize.defaultspace,
      child:TextButton(onPressed: ()=>OnboradingCotroller.inctance.skipPage(), child: Text('Sikp')));
  }
}
