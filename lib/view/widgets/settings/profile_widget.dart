import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meat_and_eat/logic/controllers/auth_controllers.dart';
import 'package:meat_and_eat/logic/controllers/settings_controller.dart';
import 'package:meat_and_eat/view/widgets/text_utils.dart';

class ProfileWidget extends StatelessWidget {
   ProfileWidget({Key? key}) : super(key: key);
  final controller = Get.find<SettingsController>();
  final authController = Get.find<AuthControllers>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                      authController.displayPhoto.value,
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  text: controller.capitalize(authController.displayName.value),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  colors: Get.isDarkMode ? Colors.white : Colors.black,
                  textDecoration: TextDecoration.none,),
                TextUtils(
                  text: authController.displayEmail.value,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  colors: Get.isDarkMode ? Colors.white : Colors.black,
                  textDecoration: TextDecoration.none,),
              ],
            )
          ],
        ))
      ],
    );
  }
}
