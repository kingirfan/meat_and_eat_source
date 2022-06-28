import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meat_and_eat/logic/controllers/auth_controllers.dart';
import 'package:meat_and_eat/logic/controllers/theme_controller.dart';
import 'package:meat_and_eat/utils/theme.dart';
import 'package:meat_and_eat/view/widgets/settings/dark_mode_widget.dart';
import 'package:meat_and_eat/view/widgets/settings/profile_widget.dart';
import 'package:meat_and_eat/view/widgets/text_utils.dart';

import '../widgets/settings/logout_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      /*body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              ThemeController().changeTheme();
            },
            child: Center(
              child: Text(
                'Settings Screen',
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GetBuilder<AuthControllers>(
            builder: (controller) {
              return TextButton(
                onPressed: () {
                  Get.defaultDialog(
                      title: 'Logout From App',
                      titleStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      middleText: 'Are you surem you want to logout',
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
                child: Center(
                  child: Text(
                    'Log',
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black),
                  ),
                ),
              );
            },
          )
        ],
      ),*/
      body: ListView(
        padding: const EdgeInsets.all(24),
        children:  [
           ProfileWidget(),
          const SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 2,
            color: Get.isDarkMode ? Colors.white : Colors.grey,
          ),
          const SizedBox(
            height: 20,
          ),
          TextUtils(
            text: 'GENERAL',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            colors: Get.isDarkMode ? pinkClr : mainColor,
            textDecoration: TextDecoration.none,
          ),
          const SizedBox(
            height: 20,
          ),
          DarkModeWidget(),
          const SizedBox(
            height: 20,
          ),
          // LanguageWidget(),
          const SizedBox(
            height: 20,
          ),
          LogoutWidget()
        ],
      ),
    );
  }
}
