import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meat_and_eat/logic/controllers/theme_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: TextButton(
        onPressed: () {
          ThemeController().changeTheme();
        },
        child: Center(
          child: Text(
              'Settings Screen',
            style: TextStyle(
              color: Get.isDarkMode ? Colors.white : Colors.black
            ),
          ),
        ),
      ),
    );
  }
}
