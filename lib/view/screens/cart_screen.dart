import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meat_and_eat/logic/controllers/cart_controller.dart';
import 'package:meat_and_eat/utils/theme.dart';
import 'package:meat_and_eat/view/widgets/cart/empty_screen.dart';

import '../widgets/cart/cart_product_screen.dart';
import '../widgets/cart/cart_total_widget.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: const Text('Cart Screen'),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          actions: [
            IconButton(
              onPressed: () {
                cartController.clearAllProductFromCart();
              },
              icon: const Icon(
                Icons.backspace,
              ),
            )
          ],
        ),
        body: Obx(() {
          if (cartController.productsMap.isEmpty) {
            return EmptyScreen();
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 600,
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return CartProductScreen(
                          productModels:
                              cartController.productsMap.keys.toList()[index],
                          quantity:
                              cartController.productsMap.values.toList()[index],
                          index: index,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 20,
                        );
                      },
                      itemCount: cartController.productsMap.length,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: CartTotalWidget(),
                  )
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
