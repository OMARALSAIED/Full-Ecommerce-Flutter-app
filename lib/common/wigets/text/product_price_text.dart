import 'package:flutter/material.dart';

class ProductPriceText extends StatelessWidget {
  ProductPriceText({
    super.key,
    this.currencysign = '\$',
    required this.price,
    this.maxline = 1,
    this.isLarg = false,
    this.linethrough = false,
  });
  final String currencysign, price;
  final int maxline;
  final bool isLarg;
  final bool linethrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      currencysign + price,
      maxLines: maxline,
      overflow: TextOverflow.ellipsis,
      style:
          isLarg
              ? Theme.of(context).textTheme.headlineMedium!.apply(
                decoration: linethrough ? TextDecoration.lineThrough : null,
              )
              : Theme.of(context).textTheme.titleLarge!.apply(
                decoration: linethrough ? TextDecoration.lineThrough : null,
              ),
    );
  }
}
