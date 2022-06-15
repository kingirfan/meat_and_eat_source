import 'package:get/get.dart';
import 'package:meat_and_eat/logic/controllers/maincontroller.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
  }
}
