import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meat_and_eat/logic/controllers/cart_controller.dart';
import 'package:meat_and_eat/utils/theme.dart';
import 'package:meat_and_eat/view/widgets/text_utils.dart';

class CartTotalWidget extends StatelessWidget {
  CartTotalWidget({Key? key}) : super(key: key);
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            children: [
              TextUtils(
                text: 'Total',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                colors: Colors.grey,
                textDecoration: TextDecoration.none,
              ),
              Text(
                '\$ ${cartController.total}',
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    height: 1.5,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
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
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(
                        'Check Out',
                       style: TextStyle(
                         fontSize: 20,
                         color: Colors.white
                       ),
                    ),
                    const SizedBox(
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
