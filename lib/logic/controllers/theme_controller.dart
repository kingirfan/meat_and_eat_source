import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController {
  final GetStorage boxStorage = GetStorage();
  final key = 'isDarkModes';

  void saveThemeChanges(bool isDark) {
    boxStorage.write(key, isDark);
  }

  bool getThemeChanges() {
    return boxStorage.read<bool>(key) ?? false;
  }

  void changeTheme() {
    Get.changeThemeMode(getThemeChanges() ? ThemeMode.light : ThemeMode.dark);
    saveThemeChanges(!getThemeChanges());
  }

  ThemeMode get themeDataGet =>
      getThemeChanges() ? ThemeMode.dark : ThemeMode.light;
}
