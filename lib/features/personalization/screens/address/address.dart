import 'package:ecommerce/common/wigets/app_bar/appbar.dart';
import 'package:ecommerce/features/personalization/screens/address/add_new_addressSCreen.dart';
import 'package:ecommerce/features/personalization/screens/address/add_new_address_card.dart';
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: ()=>Get.to(()=> const AddNewAddressscreen(),
      ),
      backgroundColor: AppColor.kPrimery,
      child: Icon(Iconsax.add,color: AppColor.kwhite,),
      ),
      appBar: TAppbar(showBackArrow: true,title: Text('Address',style: Theme.of(context).textTheme.headlineSmall,),),
      body: const SingleChildScrollView(child: Padding(padding: EdgeInsets.all(TSize.defaultspace),child:Column(
        children: [
          AddNewAddress(selectedAddress: false),
          AddNewAddress(selectedAddress: true),
        ],
      ) ,),),
    );
  }
}