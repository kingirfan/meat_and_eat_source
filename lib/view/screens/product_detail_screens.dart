
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meat_and_eat/model/product_models.dart';

import '../widgets/product_details/image_sliders.dart';

class ProductDetailsScreen extends StatelessWidget {

  final ProductModels productModels;

  const ProductDetailsScreen({Key? key, required this.productModels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSliders(imageUrl: productModels.image,)
          ],
        ),
      ),
    );
  }
}
