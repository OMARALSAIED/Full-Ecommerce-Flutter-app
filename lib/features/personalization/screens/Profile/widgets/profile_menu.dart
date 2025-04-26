
import 'package:ecommerce/util/constants/size.dart';
import 'package:flutter/material.dart';


class profile_menu extends StatelessWidget {
  const profile_menu({
    required this.onPressed,
    super.key, required this.title1, required this.title2, this.icon,
  });
  final String title1,title2;
  final IconData? icon;
 final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPressed ,
      child: Padding(
        padding: const EdgeInsets.all(TSize.spaceBtweenItems/2),
        child: Row(children: [
          Expanded(
            flex: 3,
            child: Text(title1,style: Theme.of(context).textTheme.bodySmall,overflow: TextOverflow.ellipsis,)),
          Expanded(
            flex: 5,
            child: Text(title2,style: Theme.of(context).textTheme.bodyMedium,overflow: TextOverflow.ellipsis,)),
          Expanded(child: Icon(icon))
        ],),
      ),
    );
  }
}