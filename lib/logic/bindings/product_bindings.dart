import 'package:get/get.dart';
import 'package:meat_and_eat/logic/controllers/products_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
  }
}
