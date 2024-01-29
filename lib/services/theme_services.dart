import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rentent/widgets/aby_snackbar.dart';

class ThemeServices {
  final storage = GetStorage();

  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  bool isSavedDarkMode() {
    return storage.read('isDarkMode') ?? false;
  }

  void saveThemeMode(bool isDarkMode) {
    storage.write('isDarkMode', isDarkMode);
  }

  void changeThemeMode() {
    Get.changeThemeMode(!isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light);
    saveThemeMode(!isSavedDarkMode());
    AbySnackBar.successSnackbar(
        text:
            'Theme switched to ${!isSavedDarkMode() ? 'Light Mode' : 'Dark Mode'}');
  }
}
