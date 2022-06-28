import 'package:get/get.dart';
import 'package:meat_and_eat/logic/controllers/cart_controller.dart';
import 'package:meat_and_eat/logic/controllers/category_controller.dart';
import 'package:meat_and_eat/logic/controllers/products_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
    Get.lazyPut(() => CartController());
    Get.put(CategoryController());
  }
}
