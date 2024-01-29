import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rentent/services/theme_services.dart';

import 'bindings/controller_bindings.dart';
import 'views/auth/login.dart';
import 'views/no_internet.dart';
import 'views/splash_screen.dart';
import 'widgets/bottom_navy.dart';
import 'widgets/theme.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final ThemeServices themeServices = ThemeServices();
    return GetMaterialApp(
      title: 'Rentent',
      initialBinding: ControllerBindings(),
      navigatorObservers: [GetObserver()],
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeServices.getThemeMode(),
      home: const SplashScreen(),
      routes: <String, WidgetBuilder>{
        // 'home': (BuildContext context) => const HomeScreen(),
        'login': (BuildContext context) => const LoginScreen(),
        // 'splash': (BuildContext context) => const SplashScreen(),
        'bottomNavy': (BuildContext context) => BottomNavy(),
        'nointernet': (BuildContext context) => const NoInternetScreen(),
      },
    );
  }
}
