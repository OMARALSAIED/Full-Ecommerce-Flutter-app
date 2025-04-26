import 'package:ecommerce/common/wigets/custom_shapes/circular_Container.dart';
import 'package:ecommerce/util/constants/AppColors.dart';
import 'package:ecommerce/util/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class OChoiceChip extends StatelessWidget {
  OChoiceChip({
    required this.title,
    required this.onSelected,
    this.selected = true,
    super.key,
  });
  final String title;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = THelperfunction.getColor(title) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: AppColor.transparent),
      child: ChoiceChip(
        label: isColor ? SizedBox() :  Text(title,style: Theme.of(context).textTheme.labelLarge,),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? AppColor.kwhite : null),
        avatar:
            isColor
                ? TCirculaContianer(
                  width: 50,
                  height: 50,
                  backgroundColor: THelperfunction.getColor(title)!,
                )
                : null,
        shape: isColor ? CircleBorder() : null,
        backgroundColor: isColor ? AppColor.green : null,
        labelPadding: isColor ? EdgeInsets.all(0) : null,
        padding: isColor ? EdgeInsets.all(0) : null,
      ),
    );
  }
}
