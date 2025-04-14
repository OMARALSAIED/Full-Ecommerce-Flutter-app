
import 'package:ecommerce/common/wigets/custom_shapes/primary_header_contianer.dart';
import 'package:ecommerce/features/shop/screens/home/widgets/home_appbar.dart';

import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContianer(
              child: Column(
                children: [
                  HomeAppbar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

