import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meat_and_eat/logic/controllers/settings_controller.dart';
import 'package:meat_and_eat/logic/controllers/theme_controller.dart';
import 'package:meat_and_eat/utils/theme.dart';
import 'package:meat_and_eat/view/widgets/text_utils.dart';

class DarkModeWidget extends StatelessWidget {
  DarkModeWidget({Key? key}) : super(key: key);

  final controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            builIconWidget(),
            Switch(
                value: controller.switchValue.value,
                activeColor: Get.isDarkMode ? pinkClr : mainColor,
                activeTrackColor: Get.isDarkMode ? pinkClr : mainColor,
                onChanged: (value) {
                  ThemeController().changeTheme();
                  controller.switchValue.value = value;
                })
          ],
        ));
  }

  Widget builIconWidget() {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: darkSettings),
            child: const Icon(
              Icons.dark_mode,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          TextUtils(
            text: "Dark Mode".tr,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            colors: Get.isDarkMode ? Colors.white : Colors.black,
            textDecoration: TextDecoration.none,
          )
        ],
      ),
    );
  }
}
