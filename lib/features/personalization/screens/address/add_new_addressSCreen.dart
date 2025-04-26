import 'package:ecommerce/common/wigets/app_bar/appbar.dart';
import 'package:ecommerce/util/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressscreen extends StatelessWidget {
  const AddNewAddressscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: TAppbar(
      showBackArrow: true,
      title: Text(
        'Add New Address',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    
    ),
    body:SingleChildScrollView(
      child: Padding(padding: EdgeInsets.all(TSize.defaultspace),
      child: Form(child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(prefixIcon: Icon(Iconsax.user),labelText: 'Name'),
          ),
          const SizedBox(height: TSize.spaceBtwInputFiled,),
             TextFormField(
            decoration: InputDecoration(prefixIcon: Icon(Iconsax.mobile),labelText: 'Phone Number'),
          ),
          const SizedBox(height: TSize.spaceBtwInputFiled,),
          Row(children: [
             Expanded(
            child: TextFormField(
              decoration: InputDecoration(prefixIcon: Icon(Iconsax.building_31),labelText: 'Street Address'),
            ),
          ),
          const SizedBox(width: TSize.spaceBtwInputFiled,),
             Expanded(
               child: TextFormField(
                           decoration: InputDecoration(prefixIcon: Icon(Iconsax.code),labelText: 'Postal Code'),
                         ),
             ),
          ],),
           const SizedBox(height: TSize.spaceBtwInputFiled,),
           Row(children: [
             Expanded(
            child: TextFormField(
              decoration: InputDecoration(prefixIcon: Icon(Iconsax.building),labelText: 'City'),
            ),
          ),
          const SizedBox(width: TSize.spaceBtwInputFiled,),
             Expanded(
               child: TextFormField(
                           decoration: InputDecoration(prefixIcon: Icon(Iconsax.activity),labelText: 'State'),
                         ),
             ),
          ],),
           const SizedBox(height: TSize.spaceBtwInputFiled,),
           TextFormField(
                           decoration: InputDecoration(prefixIcon: Icon(Iconsax.global),labelText: 'Country'),
                         ),
const SizedBox(height: TSize.spaceBtwSections,),
SizedBox(
  width: double.infinity,
  child: ElevatedButton(onPressed: (){}, child: Text('Save')),)
                         
         
        ],
      )),
      
      ),
    ) ,
    );
  }
}