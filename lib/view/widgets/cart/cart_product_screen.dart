import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meat_and_eat/logic/controllers/cart_controller.dart';
import 'package:meat_and_eat/model/product_models.dart';
import 'package:meat_and_eat/utils/theme.dart';

class CartProductScreen extends StatelessWidget {
  final ProductModels productModels;
  final int index;
  final int quantity;

  CartProductScreen(
      {Key? key, required this.productModels, required this.index, required this.quantity})
      : super(key: key);
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 100,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? pinkClr.withOpacity(0.8)
            : mainColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            height: 120,
            width: 100,
            margin: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage(
                    productModels.image,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModels.title,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '\$ ${cartController.productSubTotal[index].toStringAsFixed(2 )}',
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      cartController.removeProductFromCart(productModels);
                    },
                    icon: Icon(
                      Icons.remove_circle,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  Text(
                    '$quantity',
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      cartController.addProductToCart(productModels);
                    },
                    icon: Icon(
                      Icons.add_circle,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  cartController.removeOneProductFromCart(productModels);
                },
                icon: Icon(
                  Icons.delete,
                  color: Get.isDarkMode ? Colors.white : Colors.red,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
