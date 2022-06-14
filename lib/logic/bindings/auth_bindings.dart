import 'package:get/get.dart';
import 'package:meat_and_eat/logic/controllers/auth_controllers.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthControllers());
  }
}
