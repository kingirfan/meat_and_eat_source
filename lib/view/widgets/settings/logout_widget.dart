import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meat_and_eat/logic/controllers/auth_controllers.dart';

import '../../../utils/theme.dart';
import '../text_utils.dart';

class LogoutWidget extends StatelessWidget {
  LogoutWidget({Key? key}) : super(key: key);
  final controller = Get.find<AuthControllers>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthControllers>(builder: (controller) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: (){
            Get.defaultDialog(
                title: 'Logout From App',
                titleStyle: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                middleText: 'Are you sure you want to logout',
                middleTextStyle: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
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
                  controller.signOutFromApp();
                },
                buttonColor: Get.isDarkMode ? Colors.pink : mainColor);
          },
          splashColor: Get.isDarkMode ? Colors.pink : Colors.green[100],
          borderRadius: BorderRadius.circular(12),
          customBorder: const StadiumBorder(),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: darkSettings),
                child: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              TextUtils(
                text: "Logout".tr,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                colors: Get.isDarkMode ? Colors.white : Colors.black,
                textDecoration: TextDecoration.none,
              )
            ],
          ),
        ),
      );
    },);
  }
}
