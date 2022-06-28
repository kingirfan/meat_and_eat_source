import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meat_and_eat/logic/controllers/cart_controller.dart';
import 'package:meat_and_eat/model/product_models.dart';
import 'package:meat_and_eat/view/widgets/text_utils.dart';

import '../../../utils/theme.dart';

class AddCart extends StatelessWidget {

  final double price;
  final ProductModels productModels;

   AddCart({Key? key, required this.price, required this.productModels}) : super(key: key);

   final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                text: 'Price',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                colors: Colors.grey,
                textDecoration: TextDecoration.none,
              ),
              Text(
                "$price",
                style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.5
                ),
              )
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Get.isDarkMode ? pinkClr : mainColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    )
                ),
                onPressed: () {
                  controller.addProductToCart(productModels);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Add To Cart',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                      ),
                    ),
                     SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.shopping_cart)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
