import 'package:flutter/material.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key, this.textcolor, required this.title,  this.onPressed,this.showActionButton=false
  });
  final Color? textcolor;
  final bool showActionButton;
  final String title,buttontitle="See All";
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,style: Theme.of(context).textTheme.headlineSmall!.apply(color: textcolor),maxLines: 1,overflow: TextOverflow.ellipsis,),
       if(showActionButton) TextButton(onPressed: onPressed, child:  Text(buttontitle,style: TextStyle(color: Colors.black),)),
      ],
    );
  }
}

