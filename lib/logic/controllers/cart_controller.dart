import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meat_and_eat/model/product_models.dart';

import '../../utils/theme.dart';

class CartController extends GetxController {
  var productsMap = {}.obs;

  addProductToCart(ProductModels productModels) {
    if (productsMap.containsKey(productModels)) {
      productsMap[productModels] += 1;
    } else {
      productsMap[productModels] = 1;
    }
  }

  removeProductFromCart(ProductModels productModels) {
    if (productsMap.containsKey(productModels) &&
        productsMap[productModels] == 1) {
      productsMap.removeWhere((key, value) => key == productModels);
    } else {
      productsMap[productModels] -= 1;
    }
  }

  removeOneProductFromCart(ProductModels productModels) {
    productsMap.removeWhere((key, value) => key == productModels);
  }

  clearAllProductFromCart() {
    Get.defaultDialog(
        title: 'Clear Products',
        titleStyle: const TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        middleText: 'Are you sure you want to Clear products',
        middleTextStyle: const TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        backgroundColor: Colors.grey,
        radius: 10,
        textCancel: 'No',
        cancelTextColor: Colors.black,
        textConfirm: 'Yes',
        confirmTextColor: Colors.black,
        onCancel: () {
          Get.back();
        },
        onConfirm: () {
          productsMap.clear();
          Get.back();
        },
        buttonColor: Get.isDarkMode ? Colors.pink : mainColor);
  }

  get productSubTotal =>
      productsMap.entries.map((e) => e.key.price * e.value).toList();

  get total =>
      productsMap.entries
          .map((e) => e.key.price * e.value)
          .toList()
          .reduce((value, element) => value + element)
          .toStringAsFixed(2);

  int quantity() {
    if (productsMap.isEmpty) {
      return 0;
    }
    else {
      return productsMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }
}
